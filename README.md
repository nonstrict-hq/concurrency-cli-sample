# Concurrency CLI Sample
***Make sure to [read my article](https://nonstrict.eu/blog/2023/using-async-await-in-a-commandline-tool-on-older-macos-versions/) on Swift concurrency in a commandline tool before exploring this sample project.***

Minimal sample to demonstrates executables using Swift concurrency crash when running on macOS 10.15 Catalina and macOS 11 Big Sur out of the box.

## Creating a build

```sh
swift build -c release --arch x86_64 --arch arm64
```

The resulting binary can be found at `.build/apple/Products/Release/concurrency-cli-sample` and can run on both Intel and Apple Silicon Macs. 

## Demonstrating the issue

Running the build product will work as expected on macOS 12+, but will crash on macOS 10.15 and 11. The error reports that `libswift_Concurrency.dylib` can't be loaded:

```
dyld: lazy symbol binding failed: can't resolve symbol _swift_task_create in ./concurrency-cli-sample because dependent dylib @rpath/libswift_Concurrency.dylib could not be loaded
dyld: can't resolve symbol _swift_task_create in ./concurrency-cli-sample because dependent dylib @rpath/libswift_Concurrency.dylib could not be loaded
Abort trap: 6
```

## Solving the issue

Copy `$(xcode-select -p)/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift-5.5/macosx/libswift_Concurrency.dylib` next to the executable. This works because of the extra rpath set using the linker flag in [Package.swift](Package.swift). The dylib has to be shipped with the executable.

## Further reading
We explain this issue in depth on our blog.

## Authors

[Nonstrict B.V.](https://nonstrict.eu), [Mathijs Kadijk](https://github.com/mac-cain13) & [Tom Lokhorst](https://github.com/tomlokhorst), released under [MIT License](LICENSE.md).
