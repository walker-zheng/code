#include <iostream>     // std::cout
#include <functional>   // std::minus
#include <numeric>      // std::accumulate
#include <algorithm>    // std::for_each
#include <utility>


#include <vector>       // std::vector
#include <list>

#include <array>
#include <iterator>
#include <string>

#include <initializer_list>
#include <tuple>
//#include <stdexcept>
#include <memory>
#include <thread>
#include <mutex>
#include <stdio.h>
#include <stdlib.h>


#include <Windows.h>
#include <PROCESS.h>


int myfunction (int x, int y) {return x+2*y;}
struct myclass {
  int operator()(int x, int y) {return x+3*y;}
} myobject;

void Print_1 (int x) {std::cout << x << std::endl;}
struct Print_s {
  void operator() (int x) {std::cout << x << std::endl;}
} Print;



void test_func_obj()
{
  int init = 100;
  int numbers[] = {10,20,30};

  std::cout << "what we get: " << std::endl;
  std::for_each(numbers,numbers+3, Print);
  std::cout << "to acc: " << std::endl;
  Print_1(init);

  std::cout << "using default accumulate: ";
  std::cout << std::accumulate(numbers,numbers+3,init);
  std::cout << '\n';

  std::cout << "using functional's minus: ";
  std::cout << std::accumulate (numbers, numbers+3, init, std::minus<int>());
  std::cout << '\n';

  std::cout << "using custom function: ";
  std::cout << std::accumulate (numbers, numbers+3, init, myfunction);
  std::cout << '\n';

  std::cout << "using custom object: ";
  std::cout << std::accumulate (numbers, numbers+3, init, myobject);
  std::cout << '\n';

  return ;
}

void test_move_swap()
{

  std::string foo = "foo-string";
  std::string bar = "bar-string";
  std::vector<std::string> myvector;

  myvector.push_back (foo);                    // copies
  myvector.push_back (std::move(bar));         // moves

  std::cout << "myvector contains:";
  for (std::string& x:myvector) std::cout << ' ' << x;
    std::cout << bar << std::endl;
  std::cout << '\n';



  int x=10, y=20;                  // x:10 y:20
  std::swap(x,y);                  // x:20 y:10

  int foo_1[4];                      // foo: ?  ?  ?  ?
  int bar_1[] = {10,20,30,40};       // foo: ?  ?  ?  ?    bar: 10 20 30 40
  std::swap(foo_1,bar_1);              // foo: 10 20 30 40   bar: ?  ?  ?  ?

  std::cout << "foo contains:";
  for (int i: foo_1) std::cout << ' ' << i;
    std::cout << std::endl << "bar contains:" << std::endl;
  for (int i: bar_1) std::cout << ' ' << i;
    std::cout << '\n';
}


  /// init list
template<class T>
struct S {
  std::vector<T> v;
  S(std::initializer_list<T> l) : v(l) {
   std::cout << "constructed with a " << l.size() << "-element list\n";
 }
 void append(std::initializer_list<T> l) {
  v.insert(v.end(), l.begin(), l.end());
}
std::pair<const int*, size_t> c_arr() const {
        return {&v[0], v.size()};  // list-initialization in return statement
      }
    };

template<typename T>
    void templated_fn(T) { }

    int test_initial()
    {
    S<int> s = {1,2,3,4,5}; // direct list-initialization
    s.append({6,7,8});      // list-initialization in function call
    std::cout << "The vector size is now " << s.c_arr().second << " ints:\n";
    for(auto n : s.v) std::cout << ' ' << n;
      std::cout << '\n';

    std::cout << "range-for over brace-init-list: \n";
    for(int x : {-1, -2, -3}) // the rule for auto makes this ranged for work
      std::cout << x << ' ';
    std::cout << '\n';

    auto al = {10, 11, 12};   // special rule for auto
    std::cout << "The list bound to auto has size() = " << al.size() << '\n';

//    templated_fn({1,2,3}); // compiler error! "{1,2,3}" is not an expression,
                             // it has no type, and so T cannot be deduced
    templated_fn<std::initializer_list<int>>({1,2,3}); // OK
    templated_fn<std::vector<int>>({1,2,3});           // also OK
    return 0;
  }

  ///tuple

  std::tuple<double, char, std::string> get_student(int id)
  {
    if (id == 0) return std::make_tuple(3.8, 'A', "Lisa Simpson");
    if (id == 1) return std::make_tuple(2.9, 'C', "Milhouse Van Houten");
    if (id == 2) return std::make_tuple(1.7, 'D', "Ralph Wiggum");
    throw std::invalid_argument("id");
  }

  int tuple_test()
  {
    auto student0 = get_student(0);
    std::cout << "ID: 0, "
    << "GPA: " << std::get<0>(student0) << ", "
    << "grade: " << std::get<1>(student0) << ", "
    << "name: " << std::get<2>(student0) << '\n';

    double gpa1;
    char grade1;
    std::string name1;
    std::tie(gpa1, grade1, name1) = get_student(1);
    std::cout << "ID: 1, "
    << "GPA: " << gpa1 << ", "
    << "grade: " << grade1 << ", "
    << "name: " << name1 << '\n';
    return 0;
  }


  struct A {
    A(int&& n) { n = 3; std::cout << "rvalue overload, n=" << n << "\n"; }
    A(int& n)  { std::cout << "lvalue overload, n=" << n << "\n"; }
  };

template<class T, class U>
  std::unique_ptr<T> make_unique(U&& u)
  {
    return std::unique_ptr<T>(new T(std::forward<U>(u)));
  }

  int test_forward()
  {
    std::unique_ptr<A> p1 = make_unique<A>(2); // rvalue
    int i = 1;
    std::unique_ptr<A> p2 = make_unique<A>(i); // lvalue
    return 0;
  }



  /// hash
  struct S_1 {
    std::string first_name;
    std::string last_name;
  };

  namespace std {
template<>
    class hash<S_1> {
    public:
      size_t operator()(const S_1 &s) const
      {
        size_t h1 = std::hash<std::string>()(s.first_name);
        size_t h2 = std::hash<std::string>()(s.last_name);
        return h1 ^ ( h2 << 1 );
      }
    };
  }

  int test_hash()
  {
    S_1 s;
    s.first_name = "Bender";
    s.last_name =  "Rodriguez";
    std::hash<S_1> hash_fn;

    std::cout << "hash(s) = " << hash_fn(s) << "\n";
    return 0;
  }


  /// array

  int test_array()
  {
    // construction uses aggregate initialization
    std::array<int, 3> a1{ {1,2,3} };    // 除非使用=，否则需要
    std::array<int, 3> a2 = {1, 2, 3}; // 使用双重花括号
    std::array<std::string, 2> a3 = { {std::string("a"), "b"} };

    // 支持基本的容器操作
    std::sort(a1.begin(), a1.end());
    std::reverse_copy(a2.begin(), a2.end(), std::ostream_iterator<int>(std::cout, " "));

    // 支持范围for
    for(auto& s: a3)
      std::cout << s << ' ';
    return 0;
  }



  int test_reverse()
  {
    std::vector<int> v({1,2,3});
    std::for_each(std::begin(v), std::end(v),
                  [&](int value){ std::cout << value << " "; });
    std::cout << std::endl;

    std::vector<int> destiny(3);
    std::reverse_copy(std::begin(v), std::end(v), std::begin(destiny));
    std::for_each(std::begin(destiny), std::end(destiny),
                  [&](int value){ std::cout << value << " "; });
    std::cout << std::endl;
    std::reverse_copy(destiny.begin(), destiny.end(), std::ostream_iterator<int>(std::cout, " "));
    return 0;
  }





#include <thread>
#include <atomic>
#include <chrono>
// meaning of cnt:
// 10: there are no active readers or writers.
// 1...9: there are 9...1 readers active, The writer is blocked
// 0: temporary value between fetch_sub and fetch_add in reader lock
// -1: there is a writer active. The readers are blocked.
const int N = 10; // nine concurrent readers are allowed
std::atomic<int> cnt = ATOMIC_VAR_INIT(N);
std::atomic<int> o_cnt = ATOMIC_VAR_INIT(N);

std::vector<int> data;

void reader(int id)
{
  for(;;)
  {
        // lock
    while(std::atomic_fetch_sub(&cnt, 1) <= 0)
      std::atomic_fetch_add(&cnt, 1);
        // read
    if(!data.empty())
    {
      std::cout << *data.rbegin() << '\n';

      // mingwin g++ bug
      // std::cout << (  "reader " + std::to_string(id)
      //               + " sees " + std::to_string(*data.rbegin()) + '\n');

    }
    if(data.size() == 100)
      break;
        // unlock
    std::atomic_fetch_add(&cnt, 1);
        // pause
    std::this_thread::sleep_for(std::chrono::milliseconds(1));
  }
}

void writer()
{
  for(int n = 0; n < 100; ++n)
  {
        // lock
    while(std::atomic_fetch_sub(&cnt, N+1) != N)
      std::atomic_fetch_add(&cnt, N+1);
        // write
    data.push_back(n);
    std::cout << "writer pushed back " << n << '\n';
        // unlock
    std::atomic_fetch_add(&cnt, N+1);
        // pause
    std::this_thread::sleep_for(std::chrono::milliseconds(1));
  }
}

int test_atomic()
{
  std::vector<std::thread> v;
  for (int n = 0; n < N; ++n) {
    v.emplace_back(reader, n);
  }
  v.emplace_back(writer);
  for (auto& t : v) {
    t.join();
  }
  return 0;
}



// thread
  // sleep g++>=4.7 or -D_GLIBCXX_USE_NANOSLEEP
  // sleep_for works well

std::mutex g_display_mutex;
void foo()
{
    // simulate expensive operation
  std::thread::id this_id = std::this_thread::get_id();
  g_display_mutex.lock();
  std::cout << "thread " << this_id << " sleeping...\n";
  g_display_mutex.unlock();
  std::this_thread::sleep_for (std::chrono::seconds(1));
}

void bar()
{
    // simulate expensive operation
  for (int i = 0; i < 5; ++i)
  {
    /* code */
    printf("[bar] %d \n", i);
    fflush(stdout);
    std::this_thread::sleep_for (std::chrono::seconds(1));
  }
}


int test_thread()
{
  std::thread t;
  std::cout << "before starting, joinable: " << t.joinable() << '\n';

  t = std::thread(foo);
  std::cout << "after starting, joinable: " << t.joinable() << '\n';

  std::cout << "starting helper...\n";
  std::thread helper(bar);

  std::cout << "waiting for helper to finish...\n";

  std::thread t1(foo);
  std::thread t2(foo);

  t1.join();
  t2.join();
  helper.join();
  t.join();

  std::cout << "done!\n";
  return 0;
}


// windows process
struct myelem{
  int a;
  char ch;
};

void myfun(PVOID arg)
{
  std::cout<<"myfun start..."<<std::endl;
  int i=100000;
  while(1){
    std::cout<<"myfun "<<++i<<std::endl;
    Sleep(1000);
  }
}
void myfun2(PVOID arg)
{
  std::cout<<"myfun2 start..."<<std::endl;
  int i=500;
  while(1){
    std::cout<<"myfun2 "<<++i<<std::endl;
    Sleep(1000);
    if(i>=505)ExitThread(10);
  }
}
void myfun3(void *p)
{
  std::cout<<"myfun3 start..."<<std::endl;
  myelem* myp=(myelem*)p;
  std::cout<<"myfun3 "<<myp->a<<" "<<myp->ch<<std::endl;
  ExitThread(111);//设置退出码
}

//  process.h 路径有问题，使用了cygwin的
// int test_proc()
// {
//   int i=0;
//     //_beginthread 函数
//   HANDLE handle=(HANDLE)_beginthread(myfun, 0, NULL);
//   DWORD sid=0;
//   HANDLE handle2=(HANDLE)CreateThread(NULL,0,(LPTHREAD_START_ROUTINE)myfun2,0,0,&sid);
//   std::cout<<sid<<std::endl;
//   myelem e;
//   e.a=10;e.ch='A';

//   HANDLE handle3=(HANDLE)_beginthread(myfun3,0,&e);//传入参数
//   Sleep(1000);
//   if(GetExitCodeThread(handle3,&sid))std::cout<<"sid "<<sid<<std::endl;
//   TerminateThread(handle2,sid+10);
//   Sleep(2000);//如果不加这一句下面的GetExitCodeThread获得的就是259
//   GetExitCodeThread(handle2,&sid);std::cout<<"sid "<<sid<<std::endl;
//   SuspendThread(handle);//suspend
//   Sleep(2000);

//   while(1){
//     std::cout<<++i<<std::endl;
//     Sleep(1000);
//     if(i>2)ResumeThread(handle);//resume
//   }
// }

// function
struct Foo {
  void display_greeting() {
    std::cout << "Hello, world.\n";
  }
  void display_number(int i) {
    std::cout << "number: " << i << '\n';
  }
  int data = 7;
};
struct X {
  int x;

  int& easy()      {return x;}
  int& get()       {return x;}
  const int& get() const {return x;}
};

int test_func()
{
  Foo f;

  auto greet = std::mem_fn(&Foo::display_greeting);
  greet(f);

  auto print_num = std::mem_fn(&Foo::display_number);
  print_num(f, 42);

  auto access_data = std::mem_fn(&Foo::data);
  std::cout << "data: " << access_data(f) << '\n';


  std::vector<std::string> words = {"This", "is", "a", "test"};
  std::vector<std::unique_ptr<std::string>> words2;
  words2.emplace_back(new std::string("another"));
  words2.emplace_back(new std::string("test"));

  std::vector<std::size_t> lengths;
  std::transform(words.begin(),
                 words.end(),
                 std::back_inserter(lengths),
                 std::mem_fn(&std::string::size)); // uses references to strings
  std::transform(words2.begin(),
                 words2.end(),
                 std::back_inserter(lengths),
                 std::mem_fn(&std::string::size)); // uses unique_ptr to strings

  for(auto n : words)
    std::cout << n << ' ';
    // unique_ptr
    // auto_ptr是可以说你随便赋值,但赋值完了之后原来的对象就不知不觉的报废.搞得你莫名其妙.
    // 而unique就干脆不让你可以随便去复制,赋值.
    // 如果实在想传个值就哪里,显式的说明内存转移std:move一下.然后这样传值完了之后,之前的对象也同样报废了.
    // 只不过整个move你让明显的知道这样操作后会导致之前的unique_ptr对象失效.
  // for(auto n : words2) std::cout << *n << ' ';
  std::cout << std::endl;
  std::cout << "The string lengths are: ";
  for(auto n : lengths)
    std::cout << n << ' ';
  std::cout << std::endl;


  auto a = std::mem_fn        (&X::easy); // no problem at all
  // auto b = std::mem_fn<int&  >(&X::get ); // no longer works with new specification
  auto c = std::mem_fn<int&()>(&X::get ); // works with both old and new specification
  auto d = [] (X& x) {return x.get();};   // another approach to overload resolution
  X x_1;
  c(x_1) = 5;
  std::cout << a(x_1) << std::endl;
  // std::cout << b(x_1) << std::endl;
  std::cout << c(x_1) << std::endl;
  std::cout << d(x_1) << std::endl;
  return 0;

}


// bind
void f(int n1, int n2, int n3, const int& n4, int n5)
{
  std::cout << n1 << ' ' << n2 << ' ' << n3 << ' ' << n4 << ' ' << n5 << '\n';
}

int g(int n1)
{
  return n1;
}

struct Foo_2 {
  void operator()(int n1, int n2){std::cout << n1+n2 << '\n';}
  void print_sum(int n1, int n2)
  {
    std::cout << n1+n2 << '\n';
  }
  int data = 10;
};

int test_bind()
{
  using namespace std::placeholders;

    // demonstrates argument reordering and pass-by-reference
  int n = 7;
  auto f1 = std::bind(f, _2, _1, 42, std::cref(n), n);
  n = 10;
  f1(1, 2, 1001); // 1 is bound by _1, 2 is bound by _2, 1001 is unused

  // nested bind subexpressions share the placeholders
  auto f2 = std::bind(f, _3, std::bind(g, _3), _3, 4, 5);
  f2(10, 11, 12);

  // common use case: binding a RNG with a distribution
  std::default_random_engine e;
  std::uniform_int_distribution<> d(0, 10);
  std::function<int()> rnd = std::bind(d, e);
  for(int n=0; n<10; ++n)
    std::cout << rnd() << ' ';
  std::cout << '\n';

  // bind to a member function
  Foo_2 foo;
  auto f3 = std::bind(&Foo_2::print_sum, foo, 95, _1);
  f3(5);

  // bind to member data
  auto f4 = std::bind(&Foo_2::data, _1);
  std::cout << f4(foo) << '\n';
  return 0;
}

struct Foo_3 {
  Foo_3(int num) : num_(num) {}
  void print_add(int i) const { std::cout << num_+i << '\n'; }
  int num_;
};

void print_num(int i)
{
  std::cout << i << '\n';
}
int print_num_1(int i)
{
  std::cout << i << '\n';
  return i;
}

int test_mem_fn()
{
    // 保存自由函数
  std::function<void(int)> f_display = print_num;
  f_display(-9);

    // 保存 lambda 表达式
  std::function<void()> f_display_42 = []() { print_num(42); };
  auto f_display_4 = []() { return print_num_1(4); };
  f_display_42();
  f_display_4();

    // 保存 std::bind 的结果
  std::function<void()> f_display_31337 = std::bind(print_num, 31337);
  f_display_31337();

    // 保存成员函数
  std::function<void(const Foo_3&, int)> f_add_display = &Foo_3::print_add;
  Foo_3 foo(314159);
  f_add_display(foo, 1);
  return 0;
}
// cref
int test_cref()
{
  std::list<int> l = {-4, -3, -2, -1, 0, 1, 2, 3, 4};

  std::vector<std::reference_wrapper<int>> v(l.begin(), l.end());
  std::random_shuffle(v.begin(), v.end());

  std::vector<std::reference_wrapper<int>> v2(v.begin(), v.end());
  std::partition(v2.begin(), v2.end(), [](int n){return n<0;});

  std::cout << "Contents of the list: ";
  for(int n: l) {
    std::cout << n << ' ';
  }
  std::cout << '\n';

  std::cout << "Contents of the list, shuffled: ";
  for(int i: v) {
    std::cout << i << ' ';
  }
  std::cout << '\n';

  std::cout << "Shuffled elements, partitioned: ";
  for(int i: v2) {
    std::cout << i << ' ';
  }
  std::cout << '\n';
  return 0;
}


int main () {
  // test_func_obj();

  // test_move_swap();

  //test_initial();
  // tuple_test();
  // test_forward();
  // test_hash();
  // test_array();
  // test_reverse();
  // test_atomic();
  // test_thread();
  // test_func();
  // test_bind();
  // test_mem_fn();
  test_cref();

  return 0;
}
