package("libnode")
    set_homepage("https://github.com/IceBlcokMC/libnode")
    set_description("Node.js library for embedding")

    on_source(function (package)
        local plat, sha256
        if package:is_plat("windows") then
            plat = "win"
            sha256 = "0599e607ffb89cf5389420e899f683f3e33d7881873d2cad8cd87cd033276a33"
        else
            plat = "linux"
            sha256 = "3737ad2986d5e532b70421040f9af4bc0515172645c8843b623502e61381767d"
        end
        local url = format("https://github.com/IceBlcokMC/libnode/releases/download/v$(version)/libnode-%s-x64-sdk.zip", plat)
        package:add("urls", url)
        package:add("versions", "24.13.0", sha256)
    end)

    on_install(function (package)
        os.cp("include", package:installdir())
        os.cp("lib", package:installdir())
    end)

    on_load(function (package)
        package:add("includedirs", "include")
        package:add("includedirs", "include/v8")
        package:add("includedirs", "include/uv")
        package:add("linkdirs", "lib")
        if package:is_plat("windows") then
            package:add("links", "libnode")
            package:add("syslinks", "winmm", "dbghelp", "crypt32", "iphlpapi", "psapi", "userenv", "ws2_32")
        else
            package:add("links", "node")
            package:add("syslinks", "pthread", "dl")
        end
    end)
package_end()