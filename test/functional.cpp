// unary_function example
#include <iostream>     // std::cout, std::cin
#include <functional>   // std::unary_function
#include <vector>
#include <algorithm>
#include <numeric>

// a function: (also works with function object: std::divides<double> my_divide;)
double my_divide (double x, double y) {return x/y;}
struct MyPair {
	double a,b;
	double multiply() {return a*b;}
};
int test_bind()
{
	using namespace std::placeholders;    // adds visibility of _1, _2, _3,...

	// binding functions:
	std::cout << "test_bind:" << "\n\t";
	std::cout << "10/2" << '\t';
	auto fn_five = std::bind (my_divide,10,2);               // returns 10/2
	std::cout << fn_five() << '\t';                          // 5

	auto fn_half = std::bind (my_divide,_1,2);               // returns x/2
	std::cout << fn_half(10) << '\t';                        // 5

	auto fn_invert = std::bind (my_divide,_2,_1);            // returns y/x
	std::cout << "1/" << fn_invert(10,2) << '\t';                    // 0.2

	auto fn_rounding = std::bind<int> (my_divide,_1,_2);     // returns int(x/y)
	std::cout << fn_rounding(10,2) << "\n\t";                  // 3

	MyPair ten_two {10,2};

	// binding members:
	std::cout << "binding members:10*2" << '\t';
	auto bound_member_fn = std::bind (&MyPair::multiply,_1); // returns x.multiply()
	std::cout << bound_member_fn(ten_two) << "\n\t";           // 20

	std::cout << "binding members value: a " << '\t';
	auto bound_member_data = std::bind (&MyPair::a,ten_two); // returns ten_two.a
	std::cout << bound_member_data() << '\n';                // 10

	return 0;
}
struct int_holder {
	int value;
	int triple() {return value*3;}
};

int test_mem_fn() 
{
	int_holder five {5};

	// call member directly:
	std::cout << "test_mem_fn:" << "\n\t";
	std::cout << five.triple() << '\t';

	// same as above using a mem_fn:
	auto triple = std::mem_fn (&int_holder::triple);
	std::cout << triple(five) << '\n';

	return 0;
}
// a function:
int half(int x) {return x/2;}
// a function object class:
struct third_t {
	int operator()(int x) {return x/3;}
};
// a class with data members:
struct MyValue {
	int value;
	int fifth() {return value/5;}
};
int test_function()
{
	std::cout << "test_function:" << "\n\t";
	std::function<int(int)> fn1 = half;                    // function
	std::function<int(int)> fn2 = &half;                   // function pointer
	std::function<int(int)> fn3 = third_t();               // function object
	std::function<int(int)> fn4 = [](int x){return x/4;};  // lambda expression
	std::function<int(int)> fn5 = std::negate<int>();      // standard function object

	std::cout << "fn1(60): " << fn1(60) << "\n\t";
	std::cout << "fn2(60): " << fn2(60) << "\n\t";
	std::cout << "fn3(60): " << fn3(60) << "\n\t";
	std::cout << "fn4(60): " << fn4(60) << "\n\t";
	std::cout << "fn5(60): " << fn5(60) << "\n\t";

	// stuff with members:
	std::function<int(MyValue&)> value = &MyValue::value;  // pointer to data member
	std::function<int(MyValue&)> fifth = &MyValue::fifth;  // pointer to member function

	MyValue sixty {60};

	std::cout << "value(sixty): " << value(sixty) << "\n\t";
	std::cout << "fifth(sixty): " << fifth(sixty) << "\n";
}
struct AB {
	int a,b;
	int sum() {return a+b;}
};

int ten() {return 10;}            // function

int test_ref_wrapper() {
	std::cout << "test_ref_wrapper:" << "\n\t";
	std::plus<int> plus_ints;        // function object
	int AB::* p_a = &AB::a;          // pointer to data member
	int(AB::* p_sum)() = &AB::sum;   // pointer to member function

	// construct reference_wrappers using std::ref:
	auto ref_ten = std::ref(ten);             // function
	auto ref_plus_ints = std::ref(plus_ints); // function object
	auto ref_AB_sum = std::ref(p_sum);        // pointer to member function
	auto ref_AB_a = std::ref(p_a);            // pointer to data member

	AB ab {100,200};

	// invocations:
	std::cout << ref_ten() << "\n\t";
	std::cout << ref_plus_ints(5,10) << "\n\t";
	std::cout << ref_AB_sum(ab) <<"\n\t";
	std::cout << ref_AB_a( ab) << "\n\t";
	std::cout << ref_AB_a(&ab) << "\n";       // (also ok with pointer)

	return 0;
}

int test_bit_op() 
{

	int values[] = {192,168,300,100};
	int masks[] = {0xff,0xff,0xf,255};
	std::vector<int> results;

	std::cout << "test_bit_op[transform/accumulate]:" << "\n\t";
	std::cout << "and:\t\t";
	std::transform (values, std::end(values), masks, back_inserter(results), std::bit_and<int>());
	for(auto const & el : results) std::cout << el << " ";
	std::cout << "\n\t";

	int flags[] = {1,2,4,8,16,32,64,128};
	int acc = std::accumulate (flags, std::end(flags), 0, std::bit_or<int>());
	std::cout << "acc or: \t" << acc << "\n\t";
	int flags_1[] = {1,2,4,8,16,32,64,128};
	int acc_1 = std::accumulate (flags_1, std::end(flags_1), 0, std::bit_or<int>());
	std::cout << "acc xor: \t" << acc_1 << '\n';

}
int test_arithmetic_op() 
{
	int first[]={10,40,90,40,10};
	int second[]={2,3,5,7,11};
	std::vector<int> results;
	std::cout << "test_arithmetic_op[transform/accumulate]:\n\t";
	std::cout << "fisrt\t\t[";
	for(auto const & el : first) std::cout << el << " ";
	std::cout << "]\n\tsecond\t\t[";
	for(auto const & el : second) std::cout << el << " ";
	std::cout << "]\n\t";
	std::cout << "plus\t\t";
	std::transform (first, first+5, second, std::back_inserter(results), std::plus<int>());
	for(auto const & el : results) std::cout << el << " ";
	std::cout << "\n\t";
	results.clear();

	std::cout << "minus\t\t";
	std::transform (first, first+5, second, std::back_inserter(results), std::minus<int>());
	for(auto const & el : results) std::cout << el << " ";
	std::cout << "\n\t";
	results.clear();

	std::cout << "multiplies\t";
	std::transform (first, first+5, second, std::back_inserter(results), std::multiplies<int>());
	for(auto const & el : results) std::cout << el << " ";
	std::cout << "\n\t";
	results.clear();

	std::cout << "divides\t\t";
	std::transform (first, first+5, second, std::back_inserter(results), std::divides<int>());
	for(auto const & el : results) std::cout << el << " ";
	std::cout << "\n\t";
	results.clear();

	std::cout << "modulus\t\t";
	std::transform (first, first+5, second, std::back_inserter(results), std::modulus<int>());
	for(auto const & el : results) std::cout << el << " ";
	std::cout << "\n";
	results.clear();

}

int test_logical_op()
{
	std::cout << "test_logical_op:\n\t";
	std::cout << "\n";
}
int test_comparison_op()
{
	std::cout << "test_comparison_op[sort/merge/lower_bound]:\n\t";
	std::cout << "\n";
}
int main () {
	test_bind();
	test_mem_fn();
	test_function();
	test_ref_wrapper();
	test_bit_op();
	test_arithmetic_op();
	test_logical_op();
	test_comparison_op();

	return 0;
}

