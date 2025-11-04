// swift-tools-version: 5.8
import PackageDescription

let package = Package(
    name: "TYDesignableLabel",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "TYDesignableLabel",
            targets: ["TYDesignableLabel"]
        ),
    ],
    targets: [
        .target(
            name: "TYDesignableLabel",
            path: "Sources/TYDesignableLabel"
        )
    ]
)
