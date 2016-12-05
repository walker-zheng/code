bool is_prime(int n){
	// Determine if n is prime.
}

int main(){
	thread_pool pool(8); // 8 threads

	list<future<bool>> results;
	for(int n = 2;n < 10000;n++){
		// Submit a job to the pool.
		results.emplace_back(pool.async(is_prime, n));
	}

	int n = 2;
	for(auto i = results.begin();i != results.end();i++, n++){
		// i is an iterator pointing to a future representing the result of is_prime(n)
		cout << n << " ";
		bool prime = i->get(); // Wait for the task is_prime(n) to finish and get the result.
		if(prime)
			cout << "is prime";
		else
			cout << "is not prime";
		cout << endl;
	}
}

