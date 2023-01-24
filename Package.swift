// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "concurrency-cli-sample",
    platforms: [ .macOS(.v10_15) ],
    targets: [
        .executableTarget(
            name: "concurrency-cli-sample",
            dependencies: [],
            linkerSettings: [.unsafeFlags(["-Xlinker", "-rpath", "-Xlinker", "@executable_path"])]),
    ]
)
