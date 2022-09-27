// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "DiffMatchPatch",
    products: [
        .library(name: "DiffMatchPatch", targets: ["DiffMatchPatch"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "DiffMatchPatch", dependencies: []),
        .target(name: "TestUtilities", dependencies: ["DiffMatchPatch"]),
        .testTarget(name: "DiffMatchPatchTests", dependencies: ["DiffMatchPatch"]),
        .executableTarget(
            name: "SpeedTest",
            dependencies: ["TestUtilities"],
            resources: [.copy("Speedtest1.txt"), .copy("Speedtest2.txt")]
        ),
        .executableTarget(
            name: "ModeTest",
            dependencies: ["TestUtilities"]
        ),
    ]
)
