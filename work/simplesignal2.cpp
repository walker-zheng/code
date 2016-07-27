#include <stdint.h>
#include <assert.h>
#include <functional>
#include <memory>
#include <vector>

namespace Simple {

/** A counter used for:
    - counting depth of emit() call recursion
    - the number of slots called in an emission
*/
using counter_t = unsigned int;

namespace aggregation {

/** Aggregation that ignores slot return type and value, returning
    void. This is the default aggregation used by a signal's `emit()`
    function. */
template <typename Result>
class Void {
 public:
  /** Discards slot return value */
  void aggregate(Result r) {}
  /** @returns nothing, irrespective of the slot return type */
  void get() { return; }
};

/** Specialisation of Void for void slots. */
template <>
class Void<void> {
 public:
  /** Does nothing */
  void aggregate() {}
  /** @returns nothing */
  void get() { return; }
};

/** Aggregation that returns the value returned by the last slot
    called in a signal emission. If a signal has no connected slots,
    the return value is a value-initialized `Result`. */
template <typename Result>
class Last {
 public:
  /** Keeps hold of only the latest slot return value. */
  void aggregate(Result r) { m_latest = std::move(r); }
  /** @returns the return value of the last slot called from the
      signal emission. */
  Result get() { return std::move(m_latest); }

 private:
  Result m_latest{};  // Ensure value-initialisation
};

/** Aggregation that collates the values returned by each slot in a
    container. This template class is suitable for most standard
    library containers. By default, a `std::vector` is used.  If a
    signal has no connected slots, the return value is an empty
    container. */
template <typename Result,
          template <typename, typename> class Container = std::vector,
          typename Allocator = std::allocator<Result>>
class Collation {
  using Containr = Container<Result, Allocator>;
 public:
  /** Append the slot return value within the container. */
  void aggregate(Result r) { m_result.insert(m_result.end(), std::move(r)); }
  /** @returns the container of collated slot return values. */
  Containr get() { return std::move(m_result); }

 private:
  Containr m_result;
};

/** Aggregation that counts the number of slots called. */
template <typename Result>
class Counter {
 public:
  /** Increment counter and discard slots return value */
  void aggregate(Result r) { ++m_result; }
  /** @returns the number of slots called. */
  counter_t get() { return m_result; }

 private:
  counter_t m_result{};
};

/** Aggregation that counts the number of slots called,
    specialised for void slots. */
template <>
class Counter<void> {
 public:
  /** Increment counter */
  void aggregate() { ++m_result; }
  /** @returns the number of slots called. */
  counter_t get() { return m_result; }

 private:
  counter_t m_result{};
};

}  // namespace aggregation

namespace controller {

/** Continue signal emission regardless of the slot return value */
template <typename Result>
struct All {
  bool operator()(const Result & result) { return true; }
};

/** Continue signal emission -- specialisation for void slots. */
template <>
struct All<void> {
  bool operator()() { return true; }
};

/** Continue signal emission iff the slot returns a result that
    (when converted to a boolean) equals `T`. */
template <typename Result, bool T = true>
struct While {
  bool operator()(const Result & result) { return result == T; }
};

}  // namespace controller

namespace detail {

/** Undefined template class for invoking slots differently
    depending on their return type. */
template <typename Signature>
class ConnectionInvoker;

/** ConnectionInvoker specialisation for value-returning slots. */
template <typename Result, typename... Args>
class ConnectionInvoker<Result(Args...)> {
 public:
  /** Call the slot, handing its return value over to the aggregation.
      @returns `true` iff the aggregation determines that emission
      should continue. */
  template <typename Aggregation, typename Controller>
  static bool invoke(const std::function<Result(Args...)> & f,
                     Args... args,
                     Aggregation & aggregation,
                     Controller & controller) {
    Result result = f(args...);
    bool ok = controller(result);
    aggregation.aggregate(std::move(result));
    return ok;
  }
};

/** ConnectionInvoker specialisation for void slots. */
template <typename... Args>
class ConnectionInvoker<void(Args...)> {
 public:
  /** Call the slot.
      @returns `true` iff the aggregation determines that emission
      should continue. */
  template <typename Aggregation, typename Controller>
  static bool invoke(const std::function<void(Args...)> & f,
                     Args... args,
                     Aggregation & aggregation,
                     Controller & controller) {
    f(args...);
    bool ok = controller();
    aggregation.aggregate();
    return ok;
  }
};

/** Node implements a doubly-linked ring, with each node containing a
    function of type `Func`. */
template <typename Func>
class Node {
 public:
  /** Constructor */
  explicit Node(Func f)
      : m_next(this),
        m_prev(this),
        m_function(std::move(f)) {}

  /** Constructor */
  Node() : Node(nullptr) {}

  /** Destructor */
  ~Node() {}

  /** Insert `node` immediately before this node in the ring.
      @returns the inserted node */
  Node * insert(Node * node) {
    if (node) {
      node->m_prev = m_prev;
      node->m_next = this;
      m_prev->m_next = node;
      m_prev = node;
    }
    return node;
  }

  /** Extracts this node from the list.
      @returns this node */
  Node * extract() {
    m_next->m_prev = m_prev;
    m_prev->m_next = m_next;
    m_prev = m_next = nullptr;
    return this;
  }

  /** Deactivates this node (by nullifying its function) thereby
      marking this node as suitable for extraction from the list when
      convenient.
      @returns this node */
  Node * deactivate() {
    m_function = nullptr;
    return this;
  }

  /** @returns this node's function */
  const Func & function() const { return m_function; }

  /** @returns the node which follows this one in the ring. If this
      is the only node in the ring, then returns this node. */
  Node * next() { return m_next; }

 private:
  /** The next node in the ring. */
  Node * m_next;
  /** The previous node in the ring. */
  Node * m_prev;
  /** The node's function */
  Func m_function;
};

/** Exception safe counter incrementer, i.e. ensures counter is
    decremented if exception is thrown while this object is in
    scope. */
template <typename T>
class ScopedIncrement {
 public:
  /** Constructor
      @param[in,out] counter The counter to be incremented */
  explicit ScopedIncrement(T & counter) : m_counter(counter) { ++m_counter; }

  /** Destructor. Decrements the counter */
  ~ScopedIncrement() { --m_counter; }

 private:
  T & m_counter;
};

}  // namespace detail


/** Undefined template class used for specialization. */
template <typename Signature>
class Signal;

/** Signal is a template class providing an implementation of the
    infrastructure for the Observer Pattern.

    The Observer Pattern's subject contains or references one or more
    _signal_ objects. A signal is emitted when some event occurs.

    Each observer connects a _slot_ to the subject's appropriate
    signal. This is conceptually identical to Qt's celebrated 'signals
    and slots' mechanism.

    A slot is an arbitrary function, lambda expression, bind
    expression, other function object, or a pointer to a member
    function. All of a signal's connected slots must have identical
    signatures. The Signal template class is instantiated with the
    function signature shared by all of its slots.

    While the term _slot_ is used herein, alternative, commonly used
    and equally good terms include _callback_, _callback function_,
    _notification callback_, _receiver_ as well as _observer_.

    A signal is connected to a slot using `connect()`. These
    connections form a many-to-many relationship between signals and
    slots. A connection's existence implies that the emission of the
    signal will be transmitted to the slot.

    The Signal class is responsible for managing its connections to
    slots. Signal-slot connections can be removed with `disconnect()`.

    The signal is emitted to its connected slots using the `emit()`. */
template <typename Result, typename... Args>
class Signal<Result(Args...)> {
  using Slot = std::function<Result(Args...)>;
  using Connection = detail::Node<Slot>;

 public:
  using ConnectionId = Connection *;

  /** Constructor. Constructs a Signal with no connections to
      slots. */
  Signal() : m_recursionDepth(0), m_deactivations(false) {}

  /** Constructor. Constructs a Signal with a single connection to the
      given slot */
  Signal(Slot f) : Signal() { connect(std::move(f)); }

  /** Destructor. */
  ~Signal() {
    if (m_head) {
      while (m_head->next() != m_head.get())
        disconnect(m_head->next());
    }
  }

  /** Copy constructor */
  Signal(const Signal &) = delete;

  /** Copy assignment operator */
  Signal & operator=(const Signal &) = delete;

  /** Add a connection from this signal to the given slot. The slot
      can be a function, lambda expression, bind expression or another
      function object. Member functions can be connected as slots
      using alternative overloads of `connect()`.
      @returns an identifier for the newly added signal-slot connection. */
  ConnectionId connect(Slot f) {
    if (!m_head) m_head = std::unique_ptr<Connection>(new Connection());
    if (f != nullptr)
      return m_head->insert(new Connection(std::move(f)));
    else
      return nullptr;
  }

  /** Add a connection from this signal to a member function of the
      referenced object.
      @returns an identifier for the newly added signal-slot connection. */
  template <class C>
  ConnectionId connect(C & obj, Result (C::*mf)(Args...)) {
    return connect([&obj, mf](Args... args) { return (obj .* mf)(args...); });
  }

  /** Add a connection from this signal to a member function of the
      referenced const object.
      @returns an identifier for the newly added signal-slot connection. */
  template <class C>
  ConnectionId connect(const C & obj, Result (C::*mf)(Args...)) {
    return connect([&obj, mf](Args... args) { return (obj .* mf)(args...); });
  }

  /** Add a connection from this signal to a member function of the
      pointed-to object.
      @returns an identifier for the newly added signal-slot connection. */
  template <class C>
  ConnectionId connect(C * obj, Result (C::*mf)(Args...)) {
    return obj ? connect(*obj, mf) : nullptr;
  }

  /** Add a connection from this signal to a member function of the
      pointed-to const object.
      @returns an identifier for the newly added signal-slot connection. */
  template <class C>
  ConnectionId connect(const C * obj, Result (C::*mf)(Args...)) {
    return obj ? connect(*obj, mf) : nullptr;
  }

  /** Remove a connection from this signal to a slot. The connection
      is identified using the `ConnectionId` value originally returned
      by `connect()`. If more than one connection exists between this
      signal and a slot, only the connection with the given Id is
      removed, meaning the slot will still be called during emission,
      albeit one time less.
      @param[in] id The signal-slot connection Id, as returned by `connect()`.
      @returns true iff the identified connection was removed. */
  bool disconnect(ConnectionId id) {
    if (id && m_head) {
      // Scan the list for the matching connection
      Connection * node = m_head->next();
      while (node != m_head.get() && node != id)
        node = node->next();

      if (node == id) {
        // Delete or deactivate the connection
        if (m_recursionDepth == 0) {
          delete node->extract();
        } else {
          node->deactivate();
          m_deactivations = true;
        }
        return true;
      }
    }
    return false;
  }

  /** Emit a signal to all its connected slots, optionally collating
      the values they return.

      ##### Slot calling order #####

      Slots are called in the order in which they are connected to the
      signal, using the `connect()` function.

      ##### Signal modification and recursion during emission #####

      The implementation is safe against recursion, so slots may be
      connected to and disconnected from the signal during signal
      emission and recursive `emit()` calls are also safe.

      Slots connected to this signal during an emission will be called
      in that emission.

      Slots disconnected from this signal during an emission will not
      be called in that emission, unless they were called prior to
      their disconnection.

      The result of emission depends on the aggregation used to
      instantiate the `emit()` template function. By default, nothing
      is returned, i.e. `emit()` is a void function.

      ##### Aggregation #####

      An Aggregation is a class that collates the slot return values
      into a single return value. Examples are:

        - Ignore the return value (if any) from the slots and return
          void [Default].
        - Return the result of the last slot called during emission.
        - Return the results of all the calls to each of a signal's
          connected slots in a collection, such as a vector.
        - Return the number of slots which returned true/non-null
          values.

      An implementation of an Aggregation class must implement the
      following member functions:

      - `void aggregate(TypeA) {...}` -- where `TypeA` is the slot
        return type, or is implicitly convertable from it.
      - `TypeB get() {...}` -- where `TypeB` is at the
        implementer's discretion, though it is often the same as
        `TypeA`.

      An aggregation's `aggregate()` function accepts the value
      returned from each slot and either does something with it or
      ignores it.

      An aggregation's `get()` function returns the aggregated result.

      Some example Aggregation implementations are available in the
      `aggregation` namespace.

      ##### Controller #####

      A controller is a callable object that determines if or when to
      halt running emissions. Typically, though not necessarily, this
      decision is based on the slots' return value.

      The controller function should have the form:

      - `bool func(const Result &)` or
      - `bool func()`

      For value-returning and void slots respectively, where `Result`
      is the return type of the slots (or is implicitly convertable
      from it).

      @returns the output of the aggregation's `get()` function.
  */
  template <typename Aggregation = aggregation::Void<Result>,
            typename Controller = controller::All<Result>>
  auto emit(Args... args,
            Aggregation aggregation = Aggregation(),
            Controller controller = Controller())
      -> decltype(aggregation.get()) {
    using Invoker = detail::ConnectionInvoker<Result(Args...)>;
    using Increment = detail::ScopedIncrement<decltype(m_recursionDepth)>;

    if (m_head) {
      bool ok = true;
      Connection * node = m_head->next();
      while (node != m_head.get() && ok) {
        /* Increment the recursion counter to ensure that slots cannot
           recursively delete connections from the ring (thereby
           potentially invalidating this iteration), rather they only
           deactivate them. Adding connections is okay. */
        Increment scopedIncrement{m_recursionDepth};
        if (node->function() != nullptr)
          ok = Invoker::invoke(
              node->function(), args..., aggregation, controller);
        node = node->next();
      }

      if (m_recursionDepth == 0 && m_deactivations) {
        /* A slot has recursively deactivated one or more connections
           from this signal. Delete these deactivated connections
           now. */
        node = m_head->next();
        while (node != m_head.get()) {
          Connection * next = node->next();
          if (node->function() == nullptr)
            delete node->extract();
          node = next;
        }
        m_deactivations = false;
      }
    }
    return aggregation.get();
  }

 private:
  /** Inert entry point into connection ring */
  std::unique_ptr<Connection> m_head;
  /** Guard against iteration invalidation by slots that alter the Signal */
  counter_t m_recursionDepth;
  /** Have any connections been deactivated (but not deleted)? */
  bool m_deactivations;
};

}  // namespace Simple

#ifndef DISABLE_TESTS

#include <string>
#include <stdarg.h>

static std::string
string_printf(const char *format, ...)
    __attribute__((__format__(__printf__, 1, 2)));

static std::string string_printf(const char *format, ...) {
  std::string result;
  char *str = nullptr;
  va_list args;
  va_start(args, format);
  if (vasprintf(&str, format, args) >= 0)
    result = str;
  va_end(args);
  if (str)
    free(str);
  return result;
}

static uint64_t timestamp_benchmark() {
  struct timespec tp = { 0, 0 };
  if (__builtin_expect(clock_gettime(CLOCK_MONOTONIC, &tp) < 0, 0)) {
    perror("failed in clock_gettime");
    exit(-1);
  }
  uint64_t stamp = tp.tv_sec * 1000000000ULL + tp.tv_nsec;
  return stamp;
}

struct TestCounter {
  static uint64_t get();
  static void set(uint64_t);
  static void add2(void*, uint64_t);
};

namespace { // Anon

// external symbol to prevent easy inlining
void (*test_counter_add2)(void*, uint64_t) = TestCounter::add2;

static uint64_t test_counter_var = 0;

} // Anon

class BasicSignalTests {
  static std::string accu;

  struct Foo {
    char foo_bool(float f, int i, std::string s) {
      accu += string_printf("Foo: %.2f\n", f + i + s.size());
      return true;
    }
  };

  static char float_callback(float f, int, std::string) {
    accu += string_printf("float: %.2f\n", f);
    return 0;
  }

 public:
  static void run() {
    accu = "";

    Simple::Signal<char (float, int, std::string)> sig1;
    auto id1 = sig1.connect(float_callback);
    auto id2 = sig1.connect([](float, int i, std::string) {
        accu += string_printf("int: %d\n", i); return 0;
      });
    auto id3 = sig1.connect([](float, int, const std::string &s) {
        accu += string_printf("string: %s\n", s.c_str()); return 0;
      });
    sig1.emit(.3, 4, "huhu");

    bool success;
    success = sig1.disconnect(id1); assert(success == true);
    success = sig1.disconnect(id1); assert(success == false);
    success = sig1.disconnect(id2); assert(success == true);
    success = sig1.disconnect(id3); assert(success == true);
    success = sig1.disconnect(id3); assert(success == false);
    success = sig1.disconnect(id2); assert(success == false);
    Foo foo;
    sig1.connect(foo, &Foo::foo_bool);
    sig1.connect(&foo, &Foo::foo_bool);

    sig1.emit(.5, 1, "12");

    Simple::Signal<void (std::string, int)> sig2;
    sig2.connect([](std::string msg, int) {
        accu += string_printf("msg: %s", msg.c_str());
      });
    sig2.connect([](std::string, int d) {
        accu += string_printf(" *%d*\n", d);
      });

    sig2.emit("in sig2", 17);

    accu += "DONE";

    const char *expected =
        "float: 0.30\n"
        "int: 4\n"
        "string: huhu\n"
        "Foo: 3.50\n"
        "Foo: 3.50\n"
        "msg: in sig2 *17*\n"
        "DONE";
    assert(accu == expected);
  }
};

std::string BasicSignalTests::accu;

class TestAggregationVector {
  static int handler1() { return 1; }
  static int handler42() { return 42; }
  static int handler777() { return 777; }

 public:
  static void run() {
    Simple::Signal<int ()> sig_vector;
    sig_vector.connect(handler777);
    sig_vector.connect(handler42);
    sig_vector.connect(handler1);
    sig_vector.connect(handler42);
    sig_vector.connect(handler777);
    std::vector<int> results =
        sig_vector.emit<Simple::aggregation::Collation<int>>();
    const std::vector<int> reference = { 777, 42, 1, 42, 777, };
    assert(results == reference);
  }
};

class TestAggregationUniquePtrVector {
  static std::unique_ptr<int> handler1() {
    return std::unique_ptr<int>(new int(1));
  }
  static std::unique_ptr<int> handler42() {
    return std::unique_ptr<int>(new int(42));
  }
  static std::unique_ptr<int> handler777() {
    return std::unique_ptr<int>(new int(777));
  }

  static bool vecEq(const std::vector<std::unique_ptr<int>> & a,
                    const std::vector<std::unique_ptr<int>> & b) {
    if (a.size() == b.size()) {
      for (size_t i=0; i < a.size(); ++i) {
        if (*a[i] != *b[i]) return false;
      }
      return true;
    }
    else return false;
  }

 public:
  static void run() {
    Simple::Signal<std::unique_ptr<int> ()> sig_vector;
    sig_vector.connect(handler777);
    sig_vector.connect(handler42);
    sig_vector.connect(handler1);
    sig_vector.connect(handler42);
    sig_vector.connect(handler777);
    std::vector<std::unique_ptr<int>> results =
        sig_vector.emit<Simple::aggregation::Collation<std::unique_ptr<int>>>();
    std::vector<std::unique_ptr<int>> reference;
    reference.push_back(std::unique_ptr<int>(new int(777)));
    reference.push_back(std::unique_ptr<int>(new int(42)));
    reference.push_back(std::unique_ptr<int>(new int(1)));
    reference.push_back(std::unique_ptr<int>(new int(42)));
    reference.push_back(std::unique_ptr<int>(new int(777)));
    assert(vecEq(results, reference));
  }
};

class TestAggregationUntil0 {
  bool check1, check2;
  TestAggregationUntil0() : check1(0), check2(0) {}
  bool handler_true() { check1 = true; return true; }
  bool handler_false() { check2 = true; return false; }
  bool handler_abort() { abort(); }

 public:
  static void run() {
    TestAggregationUntil0 self;
    Simple::Signal<bool()> sig_until0;
    sig_until0.connect(self, &TestAggregationUntil0::handler_true);
    sig_until0.connect(self, &TestAggregationUntil0::handler_false);
    sig_until0.connect(self, &TestAggregationUntil0::handler_abort);
    assert(!self.check1 && !self.check2);
    const bool result =
        sig_until0.emit<Simple::aggregation::Last<bool>,
                        Simple::controller::While<bool, true>>();
    assert(!result && self.check1 && self.check2);
  }
};

class TestAggregationWhile0 {
  bool check1, check2;
  TestAggregationWhile0() : check1(0), check2(0) {}
  bool handler_0() { check1 = true; return false; }
  bool handler_1() { check2 = true; return true; }
  bool handler_abort() { abort(); }

 public:
  static void run() {
    TestAggregationWhile0 self;
    Simple::Signal<bool()> sig_while0;
    sig_while0.connect(self, &TestAggregationWhile0::handler_0);
    sig_while0.connect(self, &TestAggregationWhile0::handler_1);
    sig_while0.connect(self, &TestAggregationWhile0::handler_abort);
    assert(!self.check1 && !self.check2);
    const bool result =
        sig_while0.emit<Simple::aggregation::Last<bool>,
                        Simple::controller::While<bool, false>>();
    assert(result == true && self.check1 && self.check2);
  }
};

static void bench_simple_signal() {
  Simple::Signal<void (void*, uint64_t)> sig_increment;
  sig_increment.connect(test_counter_add2);
  const uint64_t start_counter = TestCounter::get();
  const uint64_t benchstart = timestamp_benchmark();
  uint64_t i;
  for(i = 0; i < 999999; i++) {
    sig_increment.emit(nullptr, 1);
  }
  const uint64_t benchdone = timestamp_benchmark();
  const uint64_t end_counter = TestCounter::get();
  assert(end_counter - start_counter == i);
  printf("OK\n  Benchmark: Simple::Signal: %fns per emission(size=%zu): ",
         size_t(benchdone - benchstart) * 1.0 / size_t(i),
         sizeof(sig_increment));
}

static void bench_callback_loop() {
  void (*counter_increment)(void*, uint64_t) = test_counter_add2;
  const uint64_t start_counter = TestCounter::get();
  const uint64_t benchstart = timestamp_benchmark();
  uint64_t i;
  for(i = 0; i < 999999; i++) {
    counter_increment(nullptr, 1);
  }
  const uint64_t benchdone = timestamp_benchmark();
  const uint64_t end_counter = TestCounter::get();
  assert(end_counter - start_counter == i);
  printf("OK\n  Benchmark: callback loop: %fns per round: ",
         size_t(benchdone - benchstart) * 1.0 / size_t(i));
}

uint64_t TestCounter::get() {
  return test_counter_var;
}

void TestCounter::set(uint64_t v) {
  test_counter_var = v;
}

void TestCounter::add2(void*, uint64_t v) {
  test_counter_var += v;
}

class RecursiveManipulationAndExceptionTests {
  static std::string accu;

  class Observer {
    using Signal = Simple::Signal<void (int, bool)>;
   public:
    Observer() {}

    // Basic receiver: no manipulation of signal
    void f1(int a, bool) {
      accu += string_printf("f1(%d) ", a);
    }

    // Manipulate signal: disconnect receiver
    void f2(int a, bool) {
      accu += string_printf("f2(%d) ", a);
      if (a == 1) m_signal.disconnect(id1);
    }

    // Manipulate signal: reconnect receiver
    void f3(int a, bool) {
      accu += string_printf("f3(%d) ", a);
      if (a == 1) id1 = m_signal.connect(this, &Observer::f1);
    }

    // Manipulate signal: connect receivers
    void f4(int a, bool) {
      accu += string_printf("f4(%d) ", a);
      if (a == 2) id6 = m_signal.connect(this, &Observer::f6);
    }

    // Recursive receiver
    void f5(int a, bool thr) {
      accu += string_printf("f5(%d) ", a);
      if (a < 3) m_signal.emit(a + 1, thr);  // Recursive step
    }

    // Exception throwing receiver
    void f6(int a, bool thr) {
      accu += string_printf("f6(%d) ", a);
      if (a == 2 && thr)
        throw std::runtime_error("f6(2) throws exception");
    }

    Signal & signal() { return m_signal; }

    Signal::ConnectionId id1;
    Signal::ConnectionId id2;
    Signal::ConnectionId id3;
    Signal::ConnectionId id4;
    Signal::ConnectionId id5;
    Signal::ConnectionId id6;

   private:
    Signal m_signal;
  };

 public:
  static void run() {
    accu = "";
    Observer g;
    g.id1 = g.signal().connect(g, &Observer::f1);
    g.id2 = g.signal().connect(g, &Observer::f2);
    g.id3 = g.signal().connect(g, &Observer::f3);
    g.id4 = g.signal().connect(g, &Observer::f4);
    g.id5 = g.signal().connect(g, &Observer::f5);

    try {
      g.signal().emit(0, true);  // true => throw exception
    } catch (const std::runtime_error & e) {
      assert(std::string(e.what()) == "f6(2) throws exception");
    }

    g.signal().emit(0, false);  // false => don't throw exception

    const char * expected =
        "f1(0) f2(0) f3(0) f4(0) f5(0) "
        "f1(1) f2(1) f3(1) f4(1) f5(1) "
        "f2(2) f3(2) f4(2) f5(2) "
        "f2(3) f3(3) f4(3) f5(3) f1(3) f6(3) "
        "f1(2) f6(2) "
        // exception thrown by f6(2) here
        "f2(0) f3(0) f4(0) f5(0) "
        "f2(1) f3(1) f4(1) f5(1) "
        "f2(2) f3(2) f4(2) f5(2) "
        "f2(3) f3(3) f4(3) f5(3) f6(3) f1(3) f6(3) "
        "f6(2) f1(2) f6(2) "
        "f6(1) f1(1) f6(1) "
        "f6(0) f1(0) f6(0) ";
    assert(accu == expected);
  }
};

std::string RecursiveManipulationAndExceptionTests::accu;

int main(int argc, char *argv[]) {
  printf("Signal/Basic Tests: ");
  BasicSignalTests::run();
  printf("OK\n");

  printf("Signal/Recursive Manipulation And Exception Tests: ");
  RecursiveManipulationAndExceptionTests::run();
  printf("OK\n");

  printf("Signal/AggregationVector: ");
  TestAggregationVector::run();
  printf("OK\n");

  printf("Signal/AggregationUniquePtrVector: ");
  TestAggregationUniquePtrVector::run();
  printf("OK\n");

  printf("Signal/AggregationUntil0: ");
  TestAggregationUntil0::run();
  printf("OK\n");

  printf("Signal/AggregationWhile0: ");
  TestAggregationWhile0::run();
  printf("OK\n");

  printf("Signal/Benchmark: Simple::Signal: ");
  bench_simple_signal();
  printf("OK\n");

  printf("Signal/Benchmark: callback loop: ");
  bench_callback_loop();
  printf("OK\n");

  return 0;
}

#endif // DISABLE_TESTS

// g++ -Wall -O2 -std=gnu++0x -pthread simplesignal.cc -lrt && ./a.out
