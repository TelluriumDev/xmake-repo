package("puerts_node")
    set_urls("https://github.com/TelluriumDev/puerts_node")
    set_description("C++ binding framework for Node.js/V8")
    set_license("BSD-3-Clause")

    add_configs("with_v8_fast_call", {description = "Enable V8 Fast Call for better performance", default = true, type = "boolean"})

    add_deps("libnode 24.13.0")

    on_load(function (package)
        if package:config("with_v8_fast_call") then
            package:add("defines", "WITH_V8_FAST_CALL")
        end
    end)

    on_install(function (package)
        local configs = {}
        if package:config("with_v8_fast_call") then
            table.insert(configs, "--with_v8_fast_call=y")
        else
            table.insert(configs, "--with_v8_fast_call=n")
        end
        import("package.tools.xmake").install(package, configs)
    end)
package_end()