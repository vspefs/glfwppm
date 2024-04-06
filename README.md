# Modularized GLFW C++ wrapper - glfwppm ![logo](logo.png)

This project, glfwppm, does not currently have a dedicated README. This is because glfwppm is simply a converter of the original GLFW C++ wrapper project [glfwpp](https://github.com/janekb04/glfwpp) to C++20 named modules. It does not introduce any additional functionality or changes beyond this conversion.

However, do check [the original glfwpp project](https://github.com/janekb04/glfwpp). The beginning part of its README goes below.

> GLFWPP or (GLFW C++ Wrapper) is a thin, modern C++17 layer on top of [GLFW](https://www.glfw.org/). It supports GLFW versions from 3.2 up to the current 3.3.6. From [the official GLFW website](https://www.glfw.org/):
>
> > GLFW is an Open Source, multi-platform library for OpenGL, OpenGL ES and Vulkan development on the desktop. It provides a simple API for creating windows, contexts and surfaces, receiving input and events.
> > GLFW is written in C and supports Windows, macOS, X11 and Wayland.
> > GLFW is licensed under the zlib/libpng license.
>
> I like C++ and OOP, so when I find a C library, I immediately look for a wrapper which offers RAII objects instead of free `create` and `destroy` functions, identifiers wrapped in `namespace`s, methods instead of free functions, scoped `enum`s instead of macros and exceptions instead of error codes. In case of GLFW I didn't really find such a library, so I made one myself.

## Notice

- This project is a work in progress. It is not yet ready for use. The original glfwpp project is already usable, so you can check it out.

- Now this project supports only MSVC and requires GLFW as static library due to my limited knowledge and laziness. I will add support for other compilers and dynamic linking in the future once I know more about xmake.

- The original glfwpp project is licensed under the MIT license. This project is also licensed under the MIT license.

<hr>