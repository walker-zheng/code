#include <iostream>
#include <mutex>
#include <map>

using namespace std;

enum class ETaskState
{
	RECV,
	EXEC,
	END,
	FAILED,
	CANCEL,
};
enum class EInputOp
{
	YES,
	NO,
	STOP,
};

static std::map<ETaskState, std::string> strState;

ETaskState nextState(ETaskState & state, EInputOp input)
{
	//std::lock_guard<std::mutex> lk(state_lock);
	if (state == ETaskState::RECV)
	{
		if (input == EInputOp::YES)
		{
			state = ETaskState::EXEC;
			//	std::cout << "r,y" << std::endl;
		}
		else if (input == EInputOp::NO || input == EInputOp::STOP)
		{
			state = ETaskState::CANCEL;
			//	std::cout << "r,ns" << std::endl;
		}
	}
	else if (state == ETaskState::EXEC)
	{
		if (input == EInputOp::YES)
		{
			state = ETaskState::END;
			//	std::cout << "e,y" << std::endl;
		}
		else if (input == EInputOp::NO)
		{
			state = ETaskState::FAILED;
			//	std::cout << "e,n" << std::endl;
		}
		else if (input == EInputOp::STOP)
		{
			state = ETaskState::CANCEL;
			//	std::cout << "e,s" << std::endl;
		}
	}

	return state;
}

int main()
{
	strState[ETaskState::RECV] = "ETaskState::RECV";
	strState[ETaskState::EXEC] = "ETaskState::EXEC";
	strState[ETaskState::END] = "ETaskState::END";
	strState[ETaskState::FAILED] = "ETaskState::FAILED";
	strState[ETaskState::CANCEL] = "ETaskState::CANCEL";

	ETaskState start = ETaskState::RECV;
	std::cout << strState[nextState(start, EInputOp::YES)] << std::endl;
	std::cout << strState[nextState(start, EInputOp::YES)] << std::endl;
	start = ETaskState::RECV;
	std::cout << strState[nextState(start, EInputOp::YES)] << std::endl;
	std::cout << strState[nextState(start, EInputOp::NO)] << std::endl;
	start = ETaskState::RECV;
	std::cout << strState[nextState(start, EInputOp::YES)] << std::endl;
	std::cout << strState[nextState(start, EInputOp::STOP)] << std::endl;

	start = ETaskState::RECV;
	std::cout << strState[nextState(start, EInputOp::NO)] << std::endl;
	start = ETaskState::RECV;
	std::cout << strState[nextState(start, EInputOp::STOP)]<< std::endl;

	return 0;
}
