#include <functional>  // for std::function
#include <utility>     // for std::forward and std::move
#include <map>
#include <vector>

template <typename Event>
class Subject
{
 public:

  template <typename Observer>
  void registerObserver(const Event& event, Observer&& observer)
  {
    observers_[event].push_back(std::forward<Observer>(observer));
  }

  template <typename Observer>
  void registerObserver(Event&& event, Observer&& observer)
  {
    observers_[std::move(event)].push_back(std::forward<Observer>(observer));
  }

  void notify(const Event& event) const
  {
    for (const auto& obs : observers_.at(event)) obs();
  }

 private:
  std::map<Event, std::vector<std::function<void()>>> observers_;
};





#include <iostream>
void foo(int i)
{
  std::cout << "foo( " <<  i << " )\n";
}

void bar() {
  std::cout << "bar()\n";
}

int main()
{

  Subject<std::string> s;
  s.registerObserver("GREEN", bar);
  s.registerObserver("ORANGE", std::bind(foo, 42));
  s.registerObserver("RED", std::bind(foo, 12345));

  const std::string msg("Hello, RED!");
  s.registerObserver("RED", [&msg]{std::cout << msg << std::endl;});

  s.notify("GREEN");
  s.notify("RED");
  s.notify("ORANGE");
}