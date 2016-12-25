#include <cpp_redis/cpp_redis>

#include <iostream>
#include <memory>
#include <thread>
#include <chrono>


int
main(void) {
	//! Enable logging
	cpp_redis::active_logger = std::unique_ptr<cpp_redis::logger>(new cpp_redis::logger);

	cpp_redis::redis_client client;

	client.connect("127.0.0.1", 6379, [](cpp_redis::redis_client&) {
		std::cout << "client disconnected (disconnection handler)" << std::endl;
	});
	auto worker = std::make_unique<std::thread>([]() 
	{
		cpp_redis::redis_client client;
		std::vector<std::string> keys;
		keys.push_back("hello");
		for (;;)
		{
			client.blpop(keys, 0, [](cpp_redis::reply& reply) {
				std::cout << "----blpop hello :" << reply << std::endl;
				// if (reply.is_string())
				//   do_something_with_string(reply.as_string())
			});
			//{
			//	using namespace std::chrono_literals;
			//	std::this_thread::sleep_for(2s);
			//}
		}
	});
	for (;;)
	{
		// same as client.send({ "SET", "hello", "42" }, ...)
		std::vector<std::string> values;
		values.push_back("42");
		values.push_back("13");
		values.push_back("11");
		client.rpush("hello", values, [&](cpp_redis::reply& reply) {
			std::cout << "lpush hello : 42 13 11 "  << reply << std::endl;
			// if (reply.is_string())
			//   do_something_with_string(reply.as_string())
		});

		// synchronous commit, no timeout
		client.sync_commit();
		{
			using namespace std::chrono_literals;
			std::this_thread::sleep_for(2s);
		}
	}

	// synchronous commit, timeout
	// client.sync_commit(std::chrono::milliseconds(100));

	return 0;
}
