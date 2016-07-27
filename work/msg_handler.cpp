#include <list>

/*
Just a placeholder for a *real* smart-pointer
(recommend std::tr1::shared_ptr, or similar).
*/
template < typename Type >
struct not_so_smart_pointer
{
	not_so_smart_pointer(Type* ptr)
		: ptr(ptr)
	{    }

	not_so_smart_pointer(not_so_smart_pointer const& rhs)
		: ptr(rhs.ptr)
	{
		const_cast< not_so_smart_pointer& >(rhs).ptr = 0;
	}

	Type* operator -> (void)
	{
		return ptr;
	}

	virtual ~not_so_smart_pointer(void)
	{
		delete ptr;
	}

	Type* ptr;
};

struct message
{
	/*
	Needs to have at least one virtual
	function for dynamic_cast to work.
	*/
	virtual ~message(void)
	{    }
};

struct message_handler
{
protected:

	/*
	These proxy classes will forward the
	message to the appropriate handler.
	*/
	struct dispatcher_base
	{
		virtual void handle(message& msg) = 0;
	};

	template < typename Message, typename Handler >
	struct dispatcher : dispatcher_base
	{
		dispatcher(Handler& obj, void (Handler::*fun)(Message&))
			: obj(obj), fun(fun)
		{    }

		virtual void handle(message& msg)
		{
			Message* ptr = dynamic_cast< Message* >(&msg);
			if (ptr)
				(obj.*fun)(*ptr);
		}

		Handler& obj;
		void (Handler::*fun)(Message&);
	};

	typedef not_so_smart_pointer< dispatcher_base > mgr_t;
	typedef std::list< mgr_t > lst_t;

public:

	/*
	An "opaque" handle to a newly-subscribed handler,
	in the event that we want to unsubscribe later.
	*/
	typedef lst_t::iterator subscription;

	message_handler(void)
	{    }

	/*
	Special case: attach to an external handler.
	Note: inserts before subscription "pos".
	*/
	template < typename Message, typename Handler >
	subscription subscribe(Handler& obj, void (Handler::*fun)(Message&), subscription pos)
	{
		lst.insert(pos, new dispatcher< Message, Handler >(obj, fun));
		return --pos;
	}

	template < typename Message, typename Handler >
	subscription subscribe(Handler& obj, void (Handler::*fun)(Message&))
	{
		return subscribe(obj, fun, lst.end());
	}

	/*
	General case: attach to *this.
	*/
	template < typename Message, typename Handler >
	inline subscription subscribe(void (Handler::*fun)(Message&), subscription pos)
	{
		return subscribe(static_cast< Handler& >(*this), fun, pos);
	}

	template < typename Message, typename Handler >
	inline subscription subscribe(void (Handler::*fun)(Message&))
	{
		return subscribe(static_cast< Handler& >(*this), fun, lst.end());
	}

	void unsubscribe(subscription sub)
	{
		lst.erase(sub);
	}

	virtual void handle(message const& msg)
	{
		for (subscription seq = lst.begin(), fin = lst.end(); seq != fin; ++seq)
			(*seq)->handle(const_cast< message& >(msg));
	}

protected:

	lst_t lst;

private:

	/*
	We have to disable the copy-constructor for now
	because we are using not_so_smart_pointer's
	*/
	message_handler(message_handler const&);
};

// Example:

#include <string>
#include <iostream>

struct shutdown_message : message
{    };

struct update_message : message
{    };

struct advanced_update_message : update_message
{    };

struct my_message_handler : message_handler
{
	my_message_handler(void)
	{
		subscribe< shutdown_message >(&my_message_handler::handle_shutdown);
		subscribe< update_message >(&my_message_handler::handle_update);
		subscribe< advanced_update_message >(&my_message_handler::handle_advanced_update);
	}

	void handle_shutdown(shutdown_message& msg)
	{
		print("handle_shutdown");
	}

	void handle_update(update_message& msg)
	{
		print("handle_update");
	}

	void handle_advanced_update(advanced_update_message& msg)
	{
		print("handle_advanced_update");
	}

	void print(std::string const& text)
	{
		std::cout << text << std::endl;
	}
};

int main(void)
{
	my_message_handler handler;
	handler.handle(advanced_update_message());
	handler.handle(shutdown_message());
}