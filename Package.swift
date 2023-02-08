// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "concurrency-cli-sample",
    platforms: [ .macOS(.v10_15) ],
    targets: [
        .executableTarget(
            name: "concurrency-cli-sample",
            dependencies: [],
            linkerSettings: [
                // When using a macOS app bundle it is recommended to put the dylib in the Frameworks folder and the binary in the Helpers folder
                // This helps to avoid hard to debug signing issues: https://developer.apple.com/documentation/bundleresources/placing_content_in_a_bundle?language=objc
                .unsafeFlags(["-Xlinker", "-rpath", "-Xlinker", "@executable_path/../Frameworks"]),
                
                // In other cases it is often practical to put the dylib next to the executable
                .unsafeFlags(["-Xlinker", "-rpath", "-Xlinker", "@executable_path"])
            ]),
    ]
)
