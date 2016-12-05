#pragma once
#include <list>
#include <unordered_map>
#include <functional>

template<typename Key, typename Ret, typename... Args>
class Observers
{
	public:
		using Observer = std::function<Ret(Args...)>;
		using ObserverList = std::list<Observer>;
		using Iterator = typename ObserverList::const_iterator;
		using ObserverMap = std::unordered_map<Key, ObserverList>;
	private:
		static ObserverMap observers;

	public:
		class ObserverScopeRef;

		Observers() = delete;

		static ObserverScopeRef Register(Key ev, Observer &&observer)
		{
			auto &f = observers[ev];
			f.push_back(std::forward<Observer>(observer));
			return ObserverScopeRef(ev, std::prev(f.end()));
		}

		static void Notify(Key ev, Args... args)
		{
			auto it = observers.find(ev);
			if (it != observers.end())
			{
				auto &obs = it->second;
				for (auto &o : obs)
				{
					o(args...);
				}
			}
		}

		template<typename Accumulator, typename Aggregator>
			static Accumulator Notify(Key ev, Args... args, Accumulator initialValue, Aggregator aggregator)
			{
				auto it = observers.find(ev);
				if (it != observers.end())
				{
					auto &obs = it->second;
					for (auto &o : obs)
					{
						aggregator(initialValue, o(args...));
					}
				}
				return initialValue;
			}

	private:
		static void Remove(Key key, Iterator iterator)
		{
			observers[key].erase(iterator);
		}

	public:
		class ObserverScopeRef
		{
			private:
				Iterator iterator;
				Key key;
				bool init;
			public:
				ObserverScopeRef(Key key, Iterator iterator) : key(key), iterator(iterator), init(true){}
				ObserverScopeRef() : init(false){}
				~ObserverScopeRef()
				{
					if (init)
						Observers::Remove(key, iterator);
				}
				ObserverScopeRef(ObserverScopeRef&) = delete;
				ObserverScopeRef(ObserverScopeRef &&other)
					:key(other.key), iterator(other.iterator), init(other.init)
				{
					other.init = false;
				}
				ObserverScopeRef& operator=(ObserverScopeRef&) = delete;
				ObserverScopeRef& operator=(ObserverScopeRef &&other)
				{
					if (this != &other)
					{
						init = other.init;
						key = other.key;
						iterator = other.iterator;
						other.init = false;
					}
					return *this;
				}
		};
};

template<typename Key, typename Ret, typename... Args>
typename Observers<Key, Ret, Args...>::ObserverMap Observers<Key, Ret, Args...>::observers;
