#include <map>
#include <future>
#include <string>
#include <thread>
#include <iostream>

int main()
{
	static std::map<std::string, std::function<void()>> m_config2func =
	{
		{ "sleep", [ & ]() { std::cout << "sleep";} },
		{ "sendMsgAck", [ & ]() { std::cout << "sendMsgAck";} },
		{ "sendMsgFailNotify", [&]() { std::cout << "sendMsgFailNotify";} },
		{ "sendMsgExecNotify", [&]() {std::cout << "sendMsgExecNotify"; } },
		{ "sendMsgResultNotify", [ &]() {std::cout << "sendMsgResultNotify";} },
		{ "sendMsgEndNotify", [ &]() {std::cout << "sendMsgEndNotify"; } }
	};
	auto promise = std::promise<std::string>();
	auto future = promise.get_future();

	for (auto op : m_config2func)
	{
		//op.second()	

	}
	auto producer = std::thread([&]
			{
			promise.set_value("Hello World");
			});


	auto consumer = std::thread([&]
			{
			while (true)
			{
			std::cout << future.get();
			promise.set_value("Hello World");
			}
			});

	producer.join();
	consumer.join();
	return 0;
}
