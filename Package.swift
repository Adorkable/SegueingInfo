import PackageDescription

let package = Package(
    name: "SegueingInfo",
    targets: [
        Target(name: "SegueingInfo")
    ],
    exclude: [
        "Examples",
        "Tests",
        "Carthage",
        "Cocoapods"
    ]
)