// swift-tools-version: 5.8


import PackageDescription

let package = Package(
    name: "DriftwoodBenchmark",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        .executable(name: "DriftwoodBenchmark", targets: ["DriftwoodBenchmark"]),
    ],
    dependencies: [
        .package(url: "https://github.com/wlgemini/Driftwood.git", .upToNextMajor(from: "5.3.4")),
        .package(url: "https://github.com/SnapKit/SnapKit.git", .upToNextMajor(from: "5.7.1"))
    ],
    targets: [
        .target(name: "DriftwoodBenchmark", dependencies: ["Driftwood", "SnapKit"]),
        .testTarget(name: "DriftwoodBenchmarkTests", dependencies: ["Driftwood", "SnapKit"]),
    ]
)
