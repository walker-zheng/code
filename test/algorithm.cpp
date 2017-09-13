#include <vector>
#include <numeric>
#include <algorithm>
#include <iterator>
#include <iostream>
#include <functional>

struct DivisibleBy
{
    const int d;
    DivisibleBy(int n) : d(n) {}
    bool operator()(int n) const { return n % d == 0; }
};
struct Sum {
    Sum() { sum = 0; }
    void operator()(int n) { sum += n; }
    int sum;
};
std::string mirror_ends(const std::string& in)
{
    return std::string(in.begin(),
            std::mismatch(in.begin(), in.end(), in.rbegin()).first);
}
bool palindrome(const std::string& s)
{
    if(std::equal(s.begin(), s.begin() + s.size()/2, s.rbegin())) {
        std::cout << s << "\t";
        return true;
    } else {
        std::cout << s << "\t";
        return false;
    }
}
    template<typename Container>
bool in_quote(const Container& cont, const std::string& s)
{
    return std::search(cont.begin(), cont.end(), s.begin(), s.end()) != cont.end();
}
    template<typename Container>
bool in_quote(const Container& cont, const std::string& s, int n)
{
    return std::search_n(cont.begin(), cont.end(), n, s.begin(), s.end()) != cont.end();
}
bool mypredicate (int i, int j) {
    return (i==j);
}
int test_none_modify()
{
    std::vector<int> v(10, 2);
    std::cout << std::boolalpha;
    std::partial_sum(v.cbegin(), v.cend(), v.begin());
    std::cout << "test_none_modify:\t\t";
    std::copy(v.cbegin(), v.cend(), std::ostream_iterator<int>(std::cout, " "));

    std::cout << "\n\tall even:\t";
    if (std::all_of(v.cbegin(), v.cend(), [](int i){ return i % 2 == 0; })) {
        std::cout << "true";
    }
    std::cout << "\n\tnone odd:\t";
    if (std::none_of(v.cbegin(), v.cend(), std::bind(std::modulus<int>(),
                    std::placeholders::_1, 2))) 
    {
        std::cout << "true";
    }
    std::cout << "\n\tany >=20:\t";
    if (std::any_of(v.cbegin(), v.cend(), [](int i){ return i >= 20; })) {
        std::cout << "true";
    }
    std::cout << "\n\tany div by 7:\t";
    if (std::any_of(v.cbegin(), v.cend(), DivisibleBy(7))) {
        std::cout << "true";
    }

    std::for_each(v.begin(), v.end(), [](int &n){ n++; });
    std::cout << "\n\tfor_each ++:\t";
    std::copy(v.begin(), v.end(), std::ostream_iterator<int>(std::cout, " "));

    Sum s = std::for_each(v.begin(), v.end(), Sum());
    std::cout << "\n\tfor_each sum:\t" << s.sum;

    //  // c++17
    //  std::for_each_n(v.begin(), 4, [](int &n){ n++; });
    //  std::cout << "\n\tfor_each_n ++:\t";
    //  std::copy(v.begin(), v.end(), std::ostream_iterator<int>(std::cout, " "));

    std::cout << "\n\tcount 5:\t" << std::count(v.begin(), v.end(), 5);
    std::cout << "\n\tcount_if %3:\t" << std::count_if(v.begin(), v.end(), [](int n){ return n % 3 == 0;});

    std::cout << "\n\tmismatch mirror_ends:\t";
    std::cout << "\n\t\tabXYZba\t" << mirror_ends("abXYZba") 
        << "\n\t\tabca\t" << mirror_ends("abca") 
        << "\n\t\taba\t" << mirror_ends("aba") ;
    std::cout << "\n\tequal palindrome:\n\t\t" << palindrome("radar") << "\n\t\t"<< palindrome("hello");

    std::cout << "\n\tfind 7:\t\t" << std::distance(v.begin(), std::find(v.begin(), v.end(), 7) );
    std::cout << "\n\tfind_if =7:\t" << std::distance(v.begin(), std::find_if(v.begin(), v.end(), [](int n){return n == 7;}) );
    std::cout << "\n\tfind_if_not =7:\t" << std::distance(v.begin(), std::find_if_not(v.begin(), v.end(), [](int n){return n == 7;}) );

    std::vector<int> t0{4, 6, 3};
    std::vector<int> t1{1, 2, 3};
    std::vector<int> t2{1, 2, 3, 4, 4, 1, 2, 3, 4, 1, 2, 3, 4};

    std::cout << "\n\tDST LIST:\t[";
    std::copy(t2.begin(), t2.end(), std::ostream_iterator<int>(std::cout, " "));
    std::cout << "]";
    std::cout << "\n\t\tfind_end [";
    std::copy(t1.begin(), t1.end(), std::ostream_iterator<int>(std::cout, " "));
    std::cout << "]:\t" 
        << std::distance(t2.begin(), std::find_end(t2.begin(), t2.end(), t1.begin(), t1.end()));
    std::cout << "\n\t\tfind_first_of [";
    std::copy(t0.begin(), t0.end(), std::ostream_iterator<int>(std::cout, " "));
    std::cout << "]:\t" 
        << std::distance(t2.begin(), std::find_first_of(t2.begin(), t2.end(), t0.begin(), t0.end()));

    std::cout << "\n\t\tadjacent_find:\t\t" << std::distance(t2.begin(), std::adjacent_find(t2.begin(), t2.end()) );

    std::string str = "why waste time learning, when ignorance is instantaneous?";
    std::string right = "learning";
    std::string wrong = "lemming";
    std::vector<char> vec(str.begin(), str.end());
    // str.find() 也能使用
    std::cout << "\n\tDST STRING:\t\"" << str << "\"";
    std::cout << "\n\tsearch string:";
    std::cout << "\n\t\tsearch "<< right << ":\t" << in_quote(str, right);
    std::cout << "\n\t\tsearch "<< wrong << ":\t\t" << in_quote(str, wrong);
    std::cout << "\n\t\tsearch_n "<< right << ":\t" << in_quote(str, right);
    std::cout << "\n\tsearch vector:";
    std::cout << "\n\t\tsearch "<< right << ":\t" << in_quote(vec, right) ;
    std::cout << "\n\t\tsearch "<< wrong << ":\t\t" << in_quote(vec, wrong) ;

    //  // C++17 重载演示：
    //  std::string in = "Lorem ipsum dolor sit amet, consectetur adipiscing elit,"
    //      " sed do eiusmod tempor incididunt ut labore et dolore magna aliqua";
    //  std::string needle = "pisci";
    //  std::cout << "\n\tDST STRING:\t\"" << in << "\"";
    //  std::cout << "\n\tsearch "<< needle << ":\t"
    //      << std::distance(it.begin(), 
    //              std::search(in.begin(), in.end(),
    //                  std::make_boyer_moore_searcher(
    //                      needle.begin(), needle.end())));

    auto myvector={10,30,10,20,30,30,20,10,10,20};
    std::cout << "\n\tDST VECTOR:\t"; 
    std::copy(myvector.begin(), myvector.end(), std::ostream_iterator<int>(std::cout, " "));
    std::cout << typeid(myvector).name() << "\t" ;
    std::cout << "\n\t\tsearch_n 2 30:\t" << std::distance(myvector.begin(),  std::search_n (myvector.begin(), myvector.end(), 2, 30));
    std::cout << "\n\t\tsearch_n 2 10:\t" << std::distance(myvector.begin(),  std::search_n (myvector.begin(), myvector.end(), 2, 10, mypredicate));
}
int main()
{
    test_none_modify();
    std::cout << std::endl;
}
