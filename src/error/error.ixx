export module vspefs.glfwppm:error;

import std;

#define GLFWPP_ERROR_CLASS(NAME, BASE)                \
    class NAME : public BASE                          \
    {                                                 \
    public:                                           \
        explicit NAME(const char* message) noexcept : \
            BASE(message) {}                          \
                                                      \
        const char* what() const noexcept             \
        {                                             \
            return BASE::what();                      \
        }                                             \
    };

export namespace glfw
{
    GLFWPP_ERROR_CLASS(Error, std::runtime_error)

    GLFWPP_ERROR_CLASS(APIUnavailableError, Error)
    GLFWPP_ERROR_CLASS(VersionUnavailableError, Error)
    GLFWPP_ERROR_CLASS(PlatformError, Error)
    GLFWPP_ERROR_CLASS(FormatUnavailableError, Error)
};  // namespace glfw