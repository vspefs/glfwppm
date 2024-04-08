package("glfwppm")

    set_homepage("https://github.com/vspefs/glfwppm")
    set_description("a module-only GLFW wrapper, based on glfwpp")

    set_urls("https://github.com/vspefs/glfwppm.git")

    add_configs("glfw_dll_windows", { description = "Choose when using the GLFW DLL on Windows", default = false, type = "boolean" })})
    add_configs("glfw_x11", { description = "Build GLFW support for X11", default = false, type = "boolean" })
    add_configs("glfw_wayland", { description = "Build GLFW support for Wayland", default = false, type = "boolean" })
    add_configs("vulkan", { description = "Build with Vulkan support", default = false, type = "boolean" })
    add_configs("vulkan-hpp", { description = "Build with Vulkan-Hpp support", default = false, type = "boolean" })
    add_configs("native_win32", { description = "Build GLFW support for native Win32", default = false, type = "boolean" })
    add_configs("native_cocoa", { description = "Build GLFW support for native Cocoa", default = false, type = "boolean" })
    add_configs("native_x11", { description = "Build GLFW support for native X11", default = false, type = "boolean" })
    add_configs("native_wayland", { description = "Build GLFW support for native Wayland", default = false, type = "boolean" })
    add_configs("native_wgl", { description = "Build GLFW support for native WGL", default = false, type = "boolean" })
    add_configs("native_nsgl", { description = "Build GLFW support for native NSGL", default = false, type = "boolean" })
    add_configs("native_glx", { description = "Build GLFW support for native GLX", default = false, type = "boolean" })
    add_configs("native_egl", { description = "Build GLFW support for native EGL", default = false, type = "boolean" })
    add_configs("native_osmesa", { description = "Build GLFW support for native OSMesa", default = false, type = "boolean" })

    on_load(function (package)
        local glfw = { 
            "config" = { 
                "glfw_include" = "none", 
                "x11" = package.config("glfw_x11"), 
                "wayland" = package.config("glfw_wayland")
            }, 
            "define" = {}
        }

        if package.config("glfw_dll_windows") then
            table.insert(glfw.defines, "GLFW_DLL")
        end
        if package.config("native_win32") then
            table.insert(glfw.defines, "GLFW_EXPOSE_NATIVE_WIN32")
        end
        if package.config("native_cocoa") then
            table.insert(glfw.defines, "GLFW_EXPOSE_NATIVE_COCOA")
        end
        if package.config("native_x11") then
            table.insert(glfw.defines, "GLFW_EXPOSE_NATIVE_X11")
        end
        if package.config("native_wayland") then
            table.insert(glfw.defines, "GLFW_EXPOSE_NATIVE_WAYLAND")
        end
        if package.config("native_wgl") then
            table.insert(glfw.defines, "GLFW_EXPOSE_NATIVE_WGL")
        end
        if package.config("native_nsgl") then
            table.insert(glfw.defines, "GLFW_EXPOSE_NATIVE_NSGL")
        end
        if package.config("native_glx") then
            table.insert(glfw.defines, "GLFW_EXPOSE_NATIVE_GLX")
        end
        if package.config("native_egl") then
            table.insert(glfw.defines, "GLFW_EXPOSE_NATIVE_EGL")
        end
        if package.config("native_osmesa") then
            table.insert(glfw.defines, "GLFW_EXPOSE_NATIVE_OSMESA")
        end
        if package.config("vulkan-hpp") and package.config("vulkan") then
            table.insert(glfw.defines, "VK_VERSION_1_0")
        else if package.config("vulkan")  then
            table.insert(glfw.defines, "VK_VERSION_1_0")
        end

        for i = 1, table.getn(glfw.defines) do
            glfw.defines[i] = "-D" .. glfw.defines[i]
        end

        package:add("deps", "glfw", {
            shared = package.config("shared"),
            cxflags = glfw.defines,
            config = glfw.config
        })
    end)

    on_install(function(package)
    {
        local configs = {}
        if package.config("native_win32") then
            table.insert(configs, "--native_win32=true")
        end
        if package.config("native_cocoa") then
            table.insert(configs, "--native_cocoa=true")
        end
        if package.config("native_x11") then
            table.insert(configs, "--native_x11=true")
        end
        if package.config("native_wayland") then
            table.insert(configs, "--native_wayland=true")
        end
        if package.config("native_wgl") then
            table.insert(configs, "--native_wgl=true")
        end
        if package.config("native_nsgl") then
            table.insert(configs, "--native_nsgl=true")
        end
        if package.config("native_glx") then
            table.insert(configs, "--native_glx=true")
        end
        if package.config("native_egl") then
            table.insert(configs, "--native_egl=true")
        end
        if package.config("native_osmesa") then
            table.insert(configs, "--native_osmesa=true")
        end
        if package.config("vulkan-hpp") and package.config("vulkan") then
            table.insert(configs, "--vulkan_hpp=true")
        else if package.config("vulkan")  then
            table.insert(configs, "--vulkan=true")
        end
        
        import("package.tools.xmake").install(package, configs)
    })