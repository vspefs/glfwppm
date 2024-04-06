export module vspefs.glfwppm:helper;

import std;

export namespace glfw
{
    namespace detail
    {
        template<typename T>
        class OwningPtr
        {
        private:
            T* _ptr;

        public:
            OwningPtr(const OwningPtr&) = delete;
            OwningPtr& operator=(const OwningPtr&) = delete;

            constexpr OwningPtr(std::nullptr_t = nullptr) noexcept :
                _ptr{}
            {
            }

            constexpr OwningPtr(T* ptr_) :
                _ptr{ptr_}
            {
            }

            constexpr OwningPtr(OwningPtr&& other) noexcept :
                _ptr{std::exchange(other._ptr, nullptr)}
            {
            }

            constexpr OwningPtr& operator=(OwningPtr&& other) noexcept
            {
                _ptr = std::exchange(other._ptr, nullptr);
                return *this;
            }

            [[nodiscard]] constexpr explicit operator bool() const noexcept
            {
                return static_cast<bool>(_ptr);
            }

            [[nodiscard]] constexpr operator T*() const noexcept
            {
                return _ptr;
            }
        };
    };  // namespace detail
};  // namespace glfw
