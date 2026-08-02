// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "FlareCoreAppleSDK",
    platforms: [
        .iOS(.v15),
        .macOS(.v12)
    ],
    products: [
        .library(name: "FlareCoreAppleSDK", targets: ["FlareCoreAppleSDK"])
    ],
    targets: [
        .systemLibrary(
            name: "CFlareImCoreSdkFFI",
            path: "Sources/CFlareImCoreSdkFFI"
        ),
        .target(
            name: "FlareCoreAppleSDK",
            dependencies: ["CFlareImCoreSdkFFI"]
        ),
        .testTarget(
            name: "FlareCoreAppleSDKTests",
            dependencies: ["FlareCoreAppleSDK"]
        )
    ]
)
