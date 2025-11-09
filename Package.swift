// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "CryptoWallet",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "CryptoWallet",
            targets: ["CryptoWallet"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/attaswift/BigInt.git", from: "5.3.0"),
        .package(url: "https://github.com/krzyzanowskim/CryptoSwift.git", from: "1.8.0"),
        .package(url: "https://github.com/argentlabs/web3swift.git", from: "3.2.0"),
        .package(url: "https://github.com/WalletConnect/WalletConnectSwift.git", from: "1.8.0"),
        .package(url: "https://github.com/SwiftGen/SwiftGen.git", from: "6.6.0"),
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture.git", from: "1.0.0"),
        .package(url: "https://github.com/onevcat/Kingfisher.git", from: "7.6.0"),
        .package(url: "https://github.com/daltoniam/Starscream.git", from: "4.0.0"),
    ],
    targets: [
        .target(
            name: "CryptoWallet",
            dependencies: [
                "BigInt",
                "CryptoSwift",
                "web3swift",
                "WalletConnectSwift",
                "SwiftGen",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                "Kingfisher",
                "Starscream",
            ],
            path: "Sources/CryptoWallet"
        ),
        .testTarget(
            name: "CryptoWalletTests",
            dependencies: ["CryptoWallet"],
            path: "Tests"
        ),
    ]
)