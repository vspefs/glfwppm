add_rules("mode.debug", "mode.release")

add_requires("glfw", {configs = {glfw_include = "none"}})

target("glfwppm")
    set_kind("moduleonly")
    set_languages("c++23")
    add_files("src/*.ixx", "src/**/*.ixx")

    set_policy("build.c++.modules", true)
    add_packages("glfw")