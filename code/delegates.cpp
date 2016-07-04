#include <algorithm>
#include <iostream>
#include <memory>
#include <utility>
#include <vector>

template <typename Signature>
struct delegate;

template <typename... Args>
struct delegate<void(Args...)>
{
    struct base {
        virtual ~base() {}
        virtual bool do_cmp(base* other) = 0;
        virtual void do_call(Args... args) = 0;
    };
    template <typename T>
    struct call: base {
        T d_callback;
        template <typename S>
        call(S&& callback): d_callback(std::forward<S>(callback)) {}

        bool do_cmp(base* other) {
            call<T>* tmp = dynamic_cast<call<T>*>(other);
            return tmp && this->d_callback == tmp->d_callback;
        }
        void do_call(Args... args) {
            return this->d_callback(std::forward<Args>(args)...);
        }
    };
    std::vector<std::unique_ptr<base>> d_callbacks;

    delegate(delegate const&) = delete;
    void operator=(delegate const&) = delete;
public:
    delegate() {}
    template <typename T>
    delegate& operator+= (T&& callback) {
        this->d_callbacks.emplace_back(new call<T>(std::forward<T>(callback)));
        return *this;
    }
    template <typename T>
    delegate& operator-= (T&& callback) {
        call<T> tmp(std::forward<T>(callback));
        auto it = std::remove_if(this->d_callbacks.begin(),
                                 this->d_callbacks.end(),
                                 [&](std::unique_ptr<base>& other) {
                                     return tmp.do_cmp(other.get());
                                 });
        this->d_callbacks.erase(it, this->d_callbacks.end());
        return *this;
    }

    void operator()(Args... args) {
        for (auto& callback: this->d_callbacks) {
            callback->do_call(args...);
        }
    }
};

// ----------------------------------------------------------------------------

template <typename RC, typename Class, typename... Args>
class member_call {
    Class* d_object;
    RC (Class::*d_member)(Args...);
public:
    member_call(Class* object, RC (Class::*member)(Args...))
        : d_object(object)
        , d_member(member) {
    }
    RC operator()(Args... args) {
        return (this->d_object->*this->d_member)(std::forward<Args>(args)...);
    }
    bool operator== (member_call const& other) const {
        return this->d_object == other.d_object
            && this->d_member == other.d_member;
    }
    bool operator!= (member_call const& other) const {
        return !(*this == other);
    }
};

template <typename RC, typename Class, typename... Args>
member_call<RC, Class, Args...> mem_call(Class& object,
                                         RC     (Class::*member)(Args...)) {
    return member_call<RC, Class, Args...>(&object, member);
}

// ----------------------------------------------------------------------------

void f(char const* str) { std::cout << "f(" << str << ")\n"; }
void g(char const* str) { std::cout << "g(" << str << ")\n"; }
void h(char const* str) { std::cout << "h(" << str << ")\n"; }

// ----------------------------------------------------------------------------

struct foo
{
    int d_id;
    explicit foo(int id): d_id(id) {}
    void bar(char const* str) {
        std::cout << "foo(" << this->d_id << ")::bar(" << str << ")\n";
    }
    void cbs(char const* str) {
        std::cout << "foo(" << this->d_id << ")::cbs(" << str << ")\n";
    }
};

// ----------------------------------------------------------------------------

int main()
{
    delegate<void(char const*)> d0;

    foo f0(0);
    foo f1(1);

    d0 += f;
    d0 += g;
    d0 += g;
    d0 += h;
    d0 += mem_call(f0, &foo::bar);
    d0 += mem_call(f0, &foo::cbs);
    d0 += mem_call(f1, &foo::bar);
    d0 += mem_call(f1, &foo::cbs);
    d0("first call");
    d0 -= g;
    d0 -= mem_call(f0, &foo::cbs);
    d0 -= mem_call(f1, &foo::bar);
    d0("second call");
}