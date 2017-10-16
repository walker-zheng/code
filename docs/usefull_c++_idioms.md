# Useful C++ idioms

##### This is in the process of being updated to use C++11 features such as
std::bind, range-for and lambdas.

This page is a collection of useful C++ idioms. It draws on three libraries -
the C++ standard library, the boost library and the Adobe source library. Each
entry shows several different ways of achieving the same thing - many of them
use standard algorithms to replace for loops. There's a discussion at the end
of the page about whether it is worth using the standard algorithms.

The definitions required to make these examples work are at the end of the
page.

If you find any mistakes or have any feedback please [ email
me](mailto:bob@bobarcher.org)

* * *

## Call a function with each element in a sequence with no additional
arguments

    for( std::vector< T >::iterator i( begin( v_T ) ); i != end( v_T ); ++i )
    {
        f_T( *i );
    }
    std::for_each( begin( v_T ), end( v_T ), f_T );
    std::for_each( begin( v_T ), end( v_T ), []( T const& i ) 
    { 
        f_T( i ); 
    } );
    adobe::for_each( v_T, f_T );
    adobe::for_each( v_T, []( T const& i ) 
    { 
        f_T( i ); 
    } );
    for( T const& i : v_T )
    {
        f_T( i );
    }

* * *

## Call a function with each element in a sequence with additional arguments

    for( std::vector< T >::iterator i( begin( v_T ) ); i != end( v_T ); ++i )
    {
        f_T_int( *i, 10 );
    }
    std::for_each( begin( v_T ), end( v_T ), std::bind( f_T_int, _1, 10 ) );
    std::for_each( begin( v_T ), end( v_T ), []( T const& i ) 
    { 
        f_T_int( i, 10 ); 
    } );
    adobe::for_each( v_T, std::bind( f_T_int, _1, 10 ) );
    adobe::for_each( v_T, []( T const& i ) 
    { 
        f_T_int( i, 10 ); 
    } );
    for( T const& i : v_T )
    {
        f_T_int( i, 10 );
    }
    

* * *

## Call a function on each element in a sequence with no arguments

    for( std::vector< T >::iterator i( begin( v_T ) ); i != end( v_T ); ++i )
    {
        i->mf_void();
    }
    std::for_each( begin( v_T ), end( v_T ), std::bind( &T::mf_void, _1 ) );
    std::for_each( begin( v_T ), end( v_T ), []( T const& i ) 
    { 
        i.mf_void(); 
    } );
    adobe::for_each( v_T, std::bind( &T::mf_void, _1 ) );
    adobe::for_each( v_T, []( T const& i ) 
    { 
        i.mf_void(); 
    } );
    for( T const& i : v_T )
    {
        i.mf_void();
    }

* * *

## Call a function on each element in a sequence with additional arguments

    int j( 7 );
    for( std::vector< T >::iterator i( begin( v_T ) ); i != end( v_T ); ++i )
    {
        i->mf_int( j );
    }
    std::for_each( begin( v_T ), end( v_T ), std::bind( &T::mf_int, _1, j ) );
    std::for_each( begin( v_T ), end( v_T ), std::bind2nd( std::mem_fun_ref( &T::mf_int ), j ) );
    std::for_each( begin( v_T ), end( v_T ), [ j ]( T const& i )
    {
        i.mf_int( j );
    } );
    adobe::for_each( v_T, std::bind( &T::mf_int, _1, j ) );
    adobe::for_each( v_T, std::bind2nd( std::mem_fun_ref( &T::mf_int ), j ) );
    adobe::for_each( v_T, [ j ]( T const& i )
    {
        i.mf_int( j );
    } );
    for( T const& i : v_T )
    {
        i.mf_int( j );
    }

* * *

## Call a function on each element in a sequence with the element as an
argument

    for( std::vector< T >::iterator i( begin( v_T ) ); i != end( v_T ); ++i )
    {
        i->mf_T( *i );
    }
    std::for_each( begin( v_T ), end( v_T ), std::bind( &T::mf_T, _1, _1 ) );
    std::for_each( begin( v_T ), end( v_T ), []( T const& t )
    {
        t.mf_T( t );
    } );
    adobe::for_each( v_T, std::bind( &T::mf_T, _1, _1 ) );
    adobe::for_each( v_T, []( T const& t )
    {
        t.mf_T( t );
    } );
    for( T const& i : v_T )
    {
        i.mf_T( i );
    }

* * *

## Find the first element which has a function returning a particular value
    
    std::vector< T >::iterator i;
    for( i = begin( v_T ); i != end( v_T ); ++i )
    {
        if( i->value() == 3 )
            break;
    }
    i = std::find_if( 
        begin( v_T ), 
        end( v_T ), 
        std::bind(
            std::equal_to< int >(), 
            std::bind( 
                &T::value,
                _1 ),
                3 ) );
    i = std::find_if( 
        begin( v_T ), 
        end( v_T ), 
        []( T const& t )
    {
        return t.value() == 3;
    } );    
    i = adobe::find_if( 
        v_T, 
        std::bind(
            std::equal_to< int >(), 
            std::bind( 
                &T::value,
                _1 ),
                3 ) );
    i = adobe::find_if( 
        v_T, 
        []( T const& t )
    {
        return t.value() == 3;
    } );
    

* * *

## Sum all of the elements in a sequence

    int n = 0;
    for( std::vector< int >::iterator i( begin( v_int ) ); i != end( v_int ); ++i )
    {
        n += *i;
    }
    n = std::accumulate( 
        begin( v_int ), 
        end( v_int ),
        0 );
    n = adobe::accumulate( 
        v_int,
        0 );
    n = 0;
    for( int i : v_int )
    {
        n += i;
    }
    

* * *

## Get the product of the elements in a sequence

    int n = 1;
    for( std::vector< int >::iterator i( begin( v_int ) ); i != end( v_int ); ++i )
    {
        n *= *i;
    }
    n = std::accumulate( 
        begin( v_int ), 
        end( v_int ), 
        1,
        std::multiplies< int >() );
    n = std::accumulate( 
        begin( v_int ), 
        end( v_int ), 
        1,
        []( int i, int elem ) {
            return i * elem;
        } );
    n = adobe::accumulate( 
        v_int,
        1,
        std::multiplies< int >() );
    n = adobe::accumulate( 
        v_int,
        1,
        []( int i, int elem ) {
            return i * elem;
        } );
    n = 1;
    for( int i : v_int )
    {
        n *= i;
    }
    

* * *

## Sum the results of calling a function of each element in a sequence

    int n;
    n = 0;
    for( std::vector< T >::iterator i( begin( v_T ) ); i != end( v_T ); ++i )
    {
        n += i->value();
    }
    n = std::accumulate( 
        begin( v_T ), 
        end( v_T ), 
        0, 
        std::bind( 
            std::plus< int >(), 
            _1, 
            std::bind( &T::value, _2 ) ) );
    n = std::accumulate( 
        begin( v_T ), 
        end( v_T ), 
        0, 
        []( int i, T const& t ) {
            return i + t.value();
        } );
    n = adobe::accumulate( 
        v_T,
        0, 
        std::bind( 
            std::plus< int >(), 
            _1, 
            std::bind( &T::value, _2 ) ) );
    n = adobe::accumulate( 
        v_T,
        0, 
        []( int i, T const& t ) {
            return i + t.value();
        } );
    n = 0;
    for( T const& t : v_int )
    {
        n += t.value();
    }

* * *

## Copy the keys of a map to a vector

    std::vector< std::string > vs;
    for( std::map< std::string, T >::iterator i( begin( m_str_T ) ); i != end( m_str_T ); ++i )
    {
        vs.push_back( i->first );
    }
    std::transform( 
        begin( m_str_T ), 
        end( m_str_T ), 
        std::back_inserter( vs ), 
        std::bind( 
            &std::map< std::string, T >::value_type::first, 
            _1 ) );
    std::transform( 
        begin( m_str_T ), 
        end( m_str_T ), 
        std::back_inserter( vs ), 
        select1st< std::map< std::string, T >::value_type >() );
    std::transform( 
        begin( m_str_T ), 
        end( m_str_T ), 
        std::back_inserter( vs ), 
        []( std::map< std::string, T >::value_type const& v ) {
            return v.first;
        } );
    adobe::transform( 
        m_str_T,
        std::back_inserter( vs ), 
        std::bind( 
            &std::map< std::string, T >::value_type::first, 
            _1 ) );
    adobe::transform( 
        m_str_T, 
        std::back_inserter( vs ), 
        select1st< std::map< std::string, T >::value_type >() );
    adobe::transform( 
        m_str_T, 
        std::back_inserter( vs ), 
        []( std::map< std::string, T >::value_type const& v ) {
            return v.first;
        } );
    for( std::map< std::string, T >::value_type const& v : m_str_T )
    {
        vs.push_back( v.first );
    }

* * *

## Copy the values of a map to a vector

    
    
    for( std::map< std::string, T >::iterator i( begin( m_str_T ) ); i != end( m_str_T ); ++i )
    {
        v_T.push_back( i->second );
    }
    std::transform( 
        begin( m_str_T ), 
        end( m_str_T ), 
        std::back_inserter( v_T ), 
        std::bind( 
            &std::map< std::string, T >::value_type::second, 
            _1 ) );
    std::transform( 
        begin( m_str_T ), 
        end( m_str_T ), 
        std::back_inserter( v_T ), 
        select2nd< std::map< std::string, T >::value_type >() );
    std::copy( 
        boost::make_transform_iterator( 
            begin( m_str_T ), 
            select2nd< std::map< std::string, T >::value_type >() ),
        boost::make_transform_iterator( 
            end( m_str_T ), 
            select2nd< std::map< std::string, T >::value_type >() ),
        std::back_inserter( v_T ) );
    adobe::transform( 
        m_str_T,
        std::back_inserter( v_T ), 
        select2nd< std::map< std::string, T >::value_type >() );
    adobe::transform( 
        m_str_T,
        std::back_inserter( v_T ), 
        std::bind( 
            &std::map< std::string, T >::value_type::second, 
            _1 ) );
    adobe::transform( 
        m_str_T,
        std::back_inserter( v_T ), 
        []( std::map< std::string, T >::value_type const& v ){ return v.second; } );
    for( std::map< std::string, T >::value_type const& v : m_str_T )
    {
        v_T.push_back( v.second );
    }

* * *

## Write the elements of a sequence to a stream

    std::ostringstream ostr;
    for( std::vector< T >::iterator i( begin( v_T ) ); i != end( v_T ); ++i )
    {
        ostr << *i << "\n";
    }
    std::copy( 
        begin( v_T ), 
        end( v_T ), 
        std::ostream_iterator< T >( 
            ostr, 
            "\n" ) );
    adobe::copy( 
        v_T, 
        std::ostream_iterator< T >( 
            ostr, 
            "\n" ) );
    for( T const& t : v_T )
    {
        ostr << t << "\n";
    }

* * *

## Read a file into a string

    std::string fileAsString;
    std::ifstream istr( fileName.c_str(), std::ios::binary );
    do
    {
        char ch( istr.get() );
        if( istr )
            fileAsString.push_back( ch );
    } while( istr );
    fileAsString = std::string(
        std::istreambuf_iterator< char >( istr ), 
        std::istreambuf_iterator< char >() );
    std::copy( 
        std::istreambuf_iterator< char >( istr ), 
        std::istreambuf_iterator< char >(), 
        std::back_inserter( fileAsString ) );

* * *

## Transform each element of a vector by putting it through one function

    for( std::vector< T >::iterator i( begin( v_T ) ); i != end( v_T ); ++i )
    {
        v_int.push_back( f_int_T( *i ) );
    }
    std::transform( 
        begin( v_T ), 
        end( v_T ), 
        std::back_inserter( v_int ), 
        f_int_T );
    std::transform( 
        begin( v_T ), 
        end( v_T ), 
        std::back_inserter( v_int ), 
        []( T const& t ) {
            return f_int_T( t );
        } );
    adobe::transform( 
        v_T, 
        std::back_inserter( v_int ), 
        f_int_T );
    adobe::transform( 
        v_T, 
        std::back_inserter( v_int ), 
        []( T const& t ) {
            return f_int_T( t );
        } );
    for( T const& t : v_T )
    {
        v_int.push_back( f_int_T( t ) );
    }

* * *

## Transform each element of a vector by putting it through two functions

    for( std::vector< T >::iterator i( begin( v_T ) ); i != end( v_T ); ++i )
    {
        v_str.push_back( f_str_int( f_int_T( *i ) ) );
    }
    std::transform( 
        begin( v_T ), 
        end( v_T ), 
        std::back_inserter( v_str ), 
        std::bind( 
            adobe::compose( 
                std::ptr_fun( f_str_int ), 
                std::ptr_fun( f_int_T ) ), 
            _1 ) );
    std::transform( 
        begin( v_T ), 
        end( v_T ), 
        std::back_inserter( v_str ), 
        std::bind( 
            f_str_int,
            std::bind( 
                f_int_T,
                _1 ) ) );
    std::transform( 
        begin( v_T ), 
        end( v_T ), 
        std::back_inserter( v_str ), 
        []( T const& t ) {
            return f_str_int( f_int_T( t ) );
        } );
    adobe::transform( 
        v_T, 
        std::back_inserter( v_str ), 
        std::bind( 
            adobe::compose( 
                std::ptr_fun( f_str_int ), 
                std::ptr_fun( f_int_T ) ), 
            _1 ) );
    adobe::transform( 
        v_T, 
        std::back_inserter( v_str ), 
        std::bind( 
            f_str_int,
            std::bind( 
                f_int_T,
                _1 ) ) );
    adobe::transform( 
        v_T, 
        std::back_inserter( v_str ), 
        []( T const& t ) {
            return f_str_int( f_int_T( t ) );
        } );
    for( T const& t : v_T )
    {
        v_str.push_back( f_str_int( f_int_T( t ) ) );
    }

* * *

## Call a function with each value in a map with no additional arguments

    for( std::map< std::string, T >::iterator i( begin( m_str_T ) ); i != end( m_str_T ); ++i )
    {
        f_T( i->second );
    }
    std::for_each( 
        begin( m_str_T ), 
        end( m_str_T ), 
        std::bind( 
            f_T, 
            std::bind( 
                select2nd< std::map< std::string, T >::value_type >(), 
                _1 ) ) );
    std::for_each( 
        begin( m_str_T ), 
        end( m_str_T ), 
        []( std::map< std::string, T >::value_type const& v ) {
            f_T( v.second );
        } );
    adobe::for_each( 
        m_str_T, 
        std::bind( 
            f_T, 
            std::bind(
                select2nd< std::map< std::string, T >::value_type >(),
                _1 ) ) );
    adobe::for_each( 
        m_str_T, 
        []( std::map< std::string, T >::value_type const& v ) {
            f_T( v.second );
        } );
    for( std::map< std::string, T >::value_type const& v : m_str_T )
    {
        f_T( v.second );
    }

* * *

## Call a function on each value in a map with additional arguments

(Only works when calling a const function)

    for( std::map< std::string, T >::iterator i( begin( m_str_T ) ); i != end( m_str_T ); ++i )
    {
        i->second.mf_int( 7 );
    }
    std::for_each( 
        begin( m_str_T ), 
        end( m_str_T ), 
        std::bind( 
            &T::mf_int, 
            std::bind( 
                &std::map< std::string, T >::value_type::second, 
                _1 ),
             7 ) );
    std::for_each( 
        begin( m_str_T ), 
        end( m_str_T ), 
        []( std::map< std::string, T >::value_type const& v ) {
            v.second.mf_int( 7 );
        } );
    adobe::for_each( 
        m_str_T, 
        std::bind( 
            &T::mf_int, 
            std::bind(
                select2nd< std::map< std::string, T >::value_type >(),
                _1 ),
            7 ) );
    adobe::for_each( 
        m_str_T, 
        []( std::map< std::string, T >::value_type const& v ) {
            v.second.mf_int( 7 );
        } );
    for( std::map< std::string, T >::value_type const& v : m_str_T )
    {
        v.second.mf_int( 7 );
    }

* * *

### Notes

  1. Typedefs and a couple of `using` statements would make most of this code shorter. I have chosen not to use these to make it explicit where the various functions and adapters are coming from.
  2. The Adobe Source Library versions of the algorithms are useful when you're working over the entire container (which accounts for probably 95% of my algorithm use).
  3. I haven't used `bind1st` or `bind2nd` in any of these examples. The hoops they make you jump through are much too convoluted for my taste. `boost::bind` provides a much more understandable way of achieving the same thing.

* * *

### Just because you can doesn't mean that you should

Is it worth using the standard algorithms? Here are a few factors to take into
consideration.

#### Length of code

All else being equal, shorter is better than longer. Unfortunately all else is
rarely equal.

#### Understandability

There are arguments in both directions here. The standard algorithms allow the
programmer to separate the looping from what goes on in the loop. When I see a
for loop I have to check the condition and the increment to see exactly what
it's looping over. I have to look at the body of the loop to see if there are
any other changes to the looping variable in there. When I see `std::for_each`
I know that the loop will access every element in the given range. When I see
`adobe::for_each` I know that the loop will acccess every element in the
container. When I see `std::transform` I know that the loop produces the same
number of values that the input range has, and that there is a one to one
correspondance between input and output values.

On the other hand, when I see code like this:

    std::transform( v_T.begin(), v_T.end(), std::back_inserter( v_str ), boost::bind( f_str_int, boost::bind( f_int_T, _1 ) ) );

I have to work pretty hard to work out what's going on. My usual limit is one
boost::bind statement in an algorithm expression. Any more than that and I
write a separate function or function object. For more discussion see Scott
Meyers' _Effective STL_ **Item 47: Avoid producing write-only code**.

Code doesn't just have to work, it has to be maintainable by you and by other
people on your team.

#### Arrangement of code

Writing a separate function or function object is a reasonable technique, but
the code is now split between the original site and the new function. In the
applications I have written there isn't a lot of reuse of functions used in
algorithms. I don't know how generally this applies.

On the one hand the code is now split into two places, on the other hand, if
the function is well named it might make the behaviour of the code easier to
understand. I think that splitting the looping from what's happening at each
iteration of the loop is beneficial \- using the standard algorithms pushes
you in that direction.

#### Efficiency

If efficiency is of concern there's no substitute for doing your own tests
under your own circumstances. Chris Cox has an interesting
[blog](http://blogs.adobe.com/cplusplusperformance/) examining C++ performance
and the abstraction penalty of using standard algorithms.

* * *

### Useful links

[The Boost libraries](http://www.boost.org/)  
[boost::bind](http://www.boost.org/libs/bind/bind.html)  
[boost::transform_iterator](http://www.boost.org/libs/iterator/doc/transform_i
terator.html)  
[Adobe Source Libraries](http://stlab.adobe.com/)  
[Chris Cox's C++ Performance
blog](http://blogs.adobe.com/cplusplusperformance/)  

* * *

### Useful references

[The C++ Standard Library: A Tutorial and Reference](http://www.amazon.com/gp/
product/0201379260?ie=UTF8&tag=bobsperssite-20&linkCode=as2&camp=1789&creative
=390957&creativeASIN=0201379260)![](./Useful C++ idioms_files/ir)  
[Effective STL: 50 Specific Ways to Improve Your Use of the Standard Template 
Library](http://www.amazon.com/gp/product/0201749629?ie=UTF8&tag=bobsperssite-
20&linkCode=as2&camp=1789&creative=390957&creativeASIN=0201749629)![](./Useful
C++ idioms_files/ir\(1\))

* * *

### Definitions required for the above code examples

    class T
    {
    public:
        T( int v );
        T( T const& );
        T& operator =( T const& );
        
        int value() const;
        void mf_void() const;
        void mf_int( int ) const;
        void mf_T( T const& ) const;
    
    private:
        int v_;
    };
    
    bool operator ==( T const&, T const& );
    
    std::ostream& operator <<( std::ostream&, T const& );
    
    void f_T( T const& );
    void f_T_int( T const&, int );
    
    std::vector< int > v_int;
    std::vector< T > v_T;
    std::vector< std::string > v_str;
    std::map< std::string, T > m_str_T;
    
    template 
    struct select1st : public std::unary_function
    {
        const typename Pair::first_type& operator()(const Pair& x) const
        { return x.first; }
    };
    
    template 
    struct select2nd : public std::unary_function
    {
        const typename Pair::second_type& operator()(const Pair& x) const
        { return x.second; }
        typename Pair::second_type& operator()(Pair& x)
        { return x.second; }
    };
    
* * *

This page last modified 11 February 2014

