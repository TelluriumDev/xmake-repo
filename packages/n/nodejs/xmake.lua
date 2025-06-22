package("nodejs")
    add_urls("https://github.com/TelluriumDev/node/releases/download/v$(version)/sdk.7z")

    add_versions("24.2.0", "cbd40deacfb83cec62e78ec53f5800e0b52150aa6560e2a963eabe017524f06e")

    add_includedirs("include/")
    add_includedirs("include/v8/")
    add_includedirs("include/uv/")

    on_install(function (package)
        os.cp("*", package:installdir())
    end)
