# c++ idioms

_if you want to see a bunch of people complaining about my rules regarding
_auto_, have a look at
[HackerNews](https://news.ycombinator.com/item?id=8193157) and [Reddit](http:/
/www.reddit.com/r/cpp/comments/2dvirt/new_c_idioms_i_use_every_day/)_

Most attention on the new C++ has focused on the changes that provide
functionality and performance that was previously not possible, both library
enhancements (chrono, regex, smart pointers, and stuff to help with lambdas
for example) and core language enhancements (perfect forwarding, variadic
templates, the new memory model and threading capabilities, initialiser lists
and the like). This functionality will impact us all in helping to write more
correct code and efficient libraries, but often will only be relevant in
certain parts of our code.

But the first thing that struck me when I started using C++11 was the smaller
features that I could take advantage of every time I put my fingers to the
keyboard. These are the things that make code more concise and simple and
allow me to present my intentions more clearly.

Stuff I take advantage of every day:

  * more concise general coding: 
    * lambdas for scoped initialisation or inline ‘builder’ functions
    * new standard library functionality for string manipulation, particularly std::to_string() and std::stoi() etc
    * range-based for loop
  * clearer declarations: 
    * inline member initialisation,
    * the `override`, `default` and `delete` keywords
    * delegating constructors,
    * uniform initialisation, especially when invoking or returning from functions
    * auto type deduction everywhere!
  * far fewer dependencies on boost

These are the things I think all C++ programmers should learn first, because
they benefit you _straight away_ and confer very little risk of being learned
wrong.

At the very end I also mention a few upcoming features that I’m really excited
about as they will be game-changers.

## More concise coding

These are the most obvious every-day enhancements, mostly focusing on making
code easier to write and to read. Some of the most pleasing languages to use
(like F#) are so because the ratio between language constructs and code
relating to logic is very low.

### use the auto keyword where possible

The `auto` keyword should be used wherever possible. Functions should be short
and readable, so don’t pollute your code with unneccessary type declarations!
Curmudgeons often claim they prefer to see the type written with the
declaration, but I think readability and maintainability trumps this. Yes,
maintainability – you want to be able to change return values, template
signatures, class names and such, and auto adapts without complaint.

Scott Meyers dedicates a chapter to this in his new ‘Effective Modern C++’
book (the item is _Item 4: Prefer auto to explicit type declarations_) – also
have a look at his presentation also entitled [Effective Modern
C++](http://vimeo.com/channels/ndc2014/97318797) where he covers the matter.

If you’re still unconvinced, [academican helpfully pointed out](http://www.red
dit.com/r/cpp/comments/2dvirt/new_c_idioms_i_use_every_day/cju6c4w) on the
[reddit discussion](http://www.reddit.com/r/cpp/comments/2dvirt/new_c_idioms_i
_use_every_day/) of this article that _Herb Sutter wrote a
[series](http://herbsutter.com/2013/06/07/gotw-92-solution-auto-variables-
part-1/) of [GOTW](http://herbsutter.com/2013/06/13/gotw-93-solution-auto-
variables-part-2/) [articles](http://herbsutter.com/2013/08/12/gotw-94
-solution-aaa-style-almost-always-auto/) on this topic last year which defend
the principle of “Almost Always Auto”. He does a much better job than I could_
. The [third article](http://herbsutter.com/2013/08/12/gotw-94-solution-aaa-
style-almost-always-auto/) explores this topic _particularly_ thoroughly.

These articles are a real treasure-trove, where Herb concludes that:

  * Guideline: Prefer to declare local variables using auto x = expr; when you don’t need to explicitly commit to a type. It is efficient by default and guarantees that no implicit conversions or temporary objects will occur
  * Guideline: Prefer to declare local variables using auto. It guarantees that you get the exact type and so is the simplest way to portably spell the implementation-specific type of arithmetic operations on built-in types, which vary by platform, and ensure that you cannot accidentally get narrowing conversions when storing the result
  * Guideline: Remember that preferring auto variables is motivated primarily by correctness, performance, maintainability, and robustness—and only lastly about typing convenience

If you still don’t agree with Scott and Herb, two of the most influential C++
gurus out there, then perhaps it would be well worth exploring why – if you
know something they don’t you’re probably able to make a lucrative living
lecturing!

### other uses for lambdas

Lambdas are of course a fantastic feature that helps us all out in so many
ways. But I tend to use it in general day-to-day stuff for what I call
**inline builder functions**. This is when you want to perform some
complicated ritual to create some resource but don’t like setting your
resources to some default ‘uninitialised’ state.

For example:
    
    // create an immutable type or one that has no 'uninitialised' state
    const int calculated = [&] {
       auto l = lock();
       auto first = stage1();
       auto second = stage2();
       return combine(first, second);
    }(); // notice I invoke the lambda here!
    
    // ... use the calculated value
    

Of course you could put this functionality in a function somewhere but this
means you don’t pollute your class namespace, and the functionality is
localised to the place you use it.

### range-based for loops

The range-based for loop is also a no-brainer. It is not as useful as it could
be – for example you often want to maintain some index as you iterate over
something, and the standard library (and even boost range) don’t provide a
nice wrapper around iterators to help with this.

As a side note (I don’t actually do this very often,) you can extend any type
to be range-based for loop-compatible by providing specialisations of
`std::begin()` and `std::end()` for that type. For example, I suppose one
could do:
    
    struct irange { int First; int Last; };
    struct irange_iterator {
       int Val;
    
       // minimalistic forward-iterator implementation
       int operator*()                            { return Val;          }
       bool operator!=(irange_iterator const & r) { return Val != r.Val; }
       irange_iterator operator++()               { return {++Val};      }
    };
    
    // begin() and end() are invoked by range-based for
    irange_iterator begin(irange const & r) { return { r.First }; }
    irange_iterator end(irange const & r) { return { r.Last + 1 }; }
    
    int main() {
       for (auto v : irange{10,20})
          std::cout << v << ", ";
    }
    
    // prints '10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20,'
    

…but don’t do it – the iterator is incomplete (and non-const-correct, and
probably buggy) and it doesn’t cover reverse ranges for starters. Plus there
are some cool libraries out there, like [CPPItertools](https://github.com/ryan
haining/cppitertools/blob/master/README.md) perhaps?

### Many new basic STL utilities

But one thing people dont mention much is that the standard library now
includes a bunch of small helper functions for basic string conversions!
Previously one might use boost `lexical_cast<>()` for this sort of thing, but
now you can generally rely on `std::to_string()` overloads and `std::stoi()`
and its variants to do the simple stuff for you.

The standard library also has new container types and algorithms. If you
haven’t familiarised yourself with the new `std::unordered_map` and
`std::array` containers you really should. And new algorithms that you’d kick
yourself for reimplementing include `all_of()`/`any_of()`/`none_of()`,
`iota()`, `minmax()`, `is_permutation()` (as well as all the other is_
functions) and `shuffle`. See this well-known [Sean Parent’s talk on C++
Seasoning](http://channel9.msdn.com/Events/GoingNative/2013/Cpp-Seasoning) for
some great discussion on using C++ algorithms to their fullest.

## Clearer declarations

Initialisation is the backbone of C++ – typically all resources should be
allocated and initialised in constructors and released deterministically in
destructors according to very specific rules, ensuring exception safety and
preventing resource leaks.

### Initialisation is much simpler

C++11 allows us to focus on our intents more than focusing on our types. For
example, the `auto` keyword and uniform initialisation both make code far
clearer:

For example, we can expect to use a nice 3D mesh API like so:
    
    auto square = create_triangle_mesh({
       {-1, 1, 1}, {-1, -1, 1}, {1, -1, 1},
       {-1, 1, 1}, { 1, -1, 1}, {1,  1, 1},
    });
    

This smacks of ‘struct initialisation’ which I really liked:
    
    struct TcpHeader {
       uint16_t src_port; uint16_t dst_port;
       uint32_t seq;
       uint32_t ack;
       // ... plus other stuff
    }
    
    // this works in C++03 as well
    TcpHeader hdr = {10012, 8088, 0x01, 0x01, /* ... */ };
    

### Construction is much more flexible

Now for trivial types you sometimes don’t need a constructor:

    // no constructor needed!
    struct counter {
       int last_ { 0 };
       int step_ { 1 };
    
       int next() { last_ += step_; return last_; }
    };
    

Now there’s a way to share construction code without resorting to a private
init() function:

    struct counter {
       int last_;
       int step_;
       counter()
       : counter { 0, 1 } { } // delegating constructor!
       counter(int last, int step)
       : last_(last), step_(step) { }
    
       int next() { last_ += step_; return last_; }
    };
    

### More explicit inheritance

I have always been jealous of languages that have the `override` keyword,
because a common trap when refactoring is to rename a virtual base method –
the compiler cannot warn you that you forgot to replace the overridden methods
in specialised classes (unless it is pure virtual, which it really should be,
but anyway…)

    struct base {
      virtual string name() { return "default"; }
    };
    
    struct derived : public base {
       // compile error - xname() is not an inherited member! 
       virtual string xname() override { return "derived!" }
    };
    

The `default` keyword can be a godsend to the concientious coder who likes to
always obey the ‘rule of three’ (or now the rule of five, or [rule of
zero](https://isocpp.org/blog/2012/11/rule-of-zero) as of lately.) Again the
benefit is in reducing code that you need to write and maintain – the best
code is no code at all.

To illustrate, imagine you have a class that encapsulates some resource
handle. The resource will of course be destroyed in the destructor, and we
choose to disallow copying to ensure that resource isn’t double-destroyed. We
want to allow moving however, because we don’t want to force clients to wrap
the resource in pointer types to pass it around…

The problem is that when one disables the copy constructor, one also disables
the move constructor. The `default` keyword allows us to re-enable it without
actually maintaining it as we update the class in future:

    struct Handle {
       Handle(int h) : impl_(100000000, h) { }
       ~Handle() = default; // just for 'rule of five' completeness
    
       // disallow copying, it would be super inefficient 
       Handle(Handle const &) = delete;
       Handle & operator=(Handle const &) = delete;
    
       // ...but allow moving, it is super fast!
       Handle(Handle &&) = default;
       Handle & operator=(Handle &&) = default;
    
       std::vector<int> impl_ = 0;
    };
    

I also use this to ensure my base class destructors are virtual, a simple
`virtual ~MyType() = default;` makes my intentions clear.

## Far fewer Boost dependencies

Boost is fantastic, but it’s a beast and can really slow down compile times.
C++11 and onward have made it so I no longer feel it necessary to include
boost when starting out with a new project – I will often add it at a much
later stage.

Essential functionality that has been taken from boost that I use all the
time:

  * chrono for time measurement: e.g., `using clock = std::chrono::steady_clock; auto now = clock::now(); auto later = now + std::chrono::seconds(10);`
  * smart pointer libraries
  * lambda helpers `std::bind` and `std::function`
  * new thread library, although `std::future` still needs a lot of work (to get a `then()` function equivalent)
  * `std::optional` to make our interfaces more explicit when invalid data may be returned
  * the `<cstdint>` header for precise platform-independent types (for example `uint32_t` instead of `unsigned int`)

Of note as well are the new regex, random and type index libraries, though
they didn’t make the list because I don’t use them as often.

**Functionality that I wish they had taken from boost, or that I would still use boost for** :

  * program options: it’s a bit complicated to use, but it gives very high quality functionality and catches all the corner cases I’ve ever needed
  * the new log library (there are probably better ones out there, but as long as I’m using boost I might as well use this one)
  * similarly, the boost unit test library is simple but effective, and you might as well use it if you’re already using boost
  * filesystem, although that is coming in C++17
  * asio, which has also been proposed for C++17
  * the range library is a hot topic, people are still trying to figure out how to get this right but boost has had a pretty good stab at it (though sadly `range::indexed` doesnt play well with range-based for yet)
  * I often expose basic event attributes on my classes using the signals2 library
  * the string manipulation and string formatting libraries can be pretty sweet as well

I will generally end up including boost in my apps because I really like these
libraries.

## Hope for the future

The C++ language committee is known for being _very_ conservative, with the
explicit objective of only adding to the language features they think will
still be relevant in the distant future. Created in 1983, the first standard
was released in 1998, and with a relatively minor update in 2003 you could be
forgiven for saying it was a relatively stagnant language.

But in the last 5 years the landscape has changed dramatically. C++11,
although released years later than intended, brings massive changes to both
the core language and standard libraries, and the language committee has
resolved to release new standards every few years, with C++14 almost released
and C++17 well underway. Today even the most knowledgable C++ consultants are
feeling their way around the language ; how to most effectively use the new
range-based for loops (prefer `for (auto && x: xs)`!) and whether perhaps
movable types should be [passed by value or by rvalue
reference](http://scottmeyers.blogspot.jp/2014/07/should-move-only-types-ever-
be-passed.html?utm_source=twitterfeed&utm_medium=twitter&m=1).

C++17 is probably even more exciting for me than C++11 was, because it solves
a couple of C++’s greatest problems: complicated error messages and crazy
compile times. Concepts will allow programmers to write template code _without
even knowing it is template code_ !. And we will all be able to create
template overloads without resorting to those crazy SFINAE techniques that are
so ugly I generally don’t use them at all.

But the real truly beautiful feature will be modules. Apple have been heading
up a team that will allow us to import modules without causing the pre-
processor to continually parse massive compilation units, which is the vast
majority of what it does these days. Apple have already implemented the
beginnings of this in ObjectiveC, so they have a good grip on the problems.
Check out [this fantastic presentation on
modules](http://llvm.org/devmtg/2012-11/Gregor-Modules.pdf) for more details.

A great summary of the current state of C++17 is the [notes of the last
standards committee meeting](http://botondballo.wordpress.com/2014/07/17/trip-
report-c-standards-committee-meeting-in-rapperswil-june-2014/) . Within you
will find such goodies as:

  * Herb Sutter’s [proposal to make return values explicit](http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2014/n4029.pdf) . This will make returning `unique_ptr` types as simple as `return {new Thing}`.
  * a proposal for [better nested namespace syntax](http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2014/n4026.html) (e.g., `namespace pcx::gl { /* my declarations */ }` )
  * the proposal for enhanced ranged-based for syntax to prevent accidental misuse (currently the recommended syntax is actuall `for (auto && x : xs)`, but this will allow us to use `for (x : xs)`)

My wishlist for future enhancements include:

  * better functional constructs (I found a youtube clip of some guy fantasising about [piping data ranges around](https://www.youtube.com/watch?v=YJIaGRDIyEE) ).
  * declarative computation expressions: python, C# and every functional language ever have great consise declarative formats for generating series of data that I would love in C++.
  * new primitives to make async programming easier – (`async` and `await` are apparently on the way, boost already has a coroutines library!)
  * stable C++ ABI allowing portable libraries (compilation units from different compilers or even platforms), would mean header-only types can be used in library interfaces/boundaries (e.g., currently cant have boost::any<> in an exported header because it would turn into different code on client and library.) This is already proposed by Herb Sutter [here](http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2014/n4028.pdf)


