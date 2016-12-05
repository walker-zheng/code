#include <iostream>
#include <memory>
#include <type_traits>
#include <typeindex>
#include <map>

struct factory
{
	virtual ~factory() = default ;

	template < typename T, typename... ARGS > static std::shared_ptr<T> create( ARGS... args )
	{
		auto p = get<T>() ;
		return p ? p->create( args... ) : nullptr ;
	}

	factory( const std::type_info& ti ) : key(ti) { map.emplace(key,this) ; }

	private:
	std::type_index key ;
	static std::map< std::type_index, factory* > map ;

	template < typename T > static typename T::factory_type* get()
	{
		const auto iter = map.find( typeid(T) ) ;
		return iter == map.end() ? nullptr : dynamic_cast<typename T::factory_type*>(iter->second) ;
	}
};

std::map< std::type_index, factory* > factory::map ;

template < typename T > struct default_factory : factory
{
	using type = T ;

	default_factory() : factory( typeid(T) ) {}

	template < typename... ARGS > std::shared_ptr<T> create( ARGS... args )
	{ return std::make_shared<T>( args... ) ; }
};

template < typename T > struct with_default_factory
{
	using factory_type = default_factory<T> ;
	static factory_type Tfactory ;
	const bool force_instantiation = std::addressof(Tfactory) ;
};

template < typename T > typename with_default_factory<T>::factory_type with_default_factory<T>::Tfactory ;

