// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import Foundation

var package = Package(
    name: "MirrorUse",
    platforms: [
        .macOS(.v11),
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        
    ],
    dependencies: [
        // .package(path: "../MirrorOrigin"),
        .package(url: "https://github.com/yume190/MirrorOrigin", exact: "1.0.0"),
        // .package(url: "https://github.com/yume190/MirrorPrebuilt", exact: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .executableTarget(
            name: "MirrorUse",
            dependencies: [
                .product(name: "MirrorOrigin", package: "MirrorOrigin"),
            ]
        ),
        
    ]
)

// private func patchToUsePrebuiltXcframeworks(in package: inout Package) {
//     func patchMacro(_ target: Target, _ macro: String) {
//         var settings = target.swiftSettings ?? []
//         settings.append(.unsafeFlags([
//             "-load-plugin-executable", "XCFrameworks/\(macro)#\(macro)"
//         ]))
//         target.swiftSettings = settings
//     }

// #if os(macOS)
//     if ProcessInfo.processInfo.environment["USE_PREBUILT"] != nil {
//         package.dependencies = [
//             .package(path: "XCFrameworks/packages/MirrorOrigin"),
//         ]
//         for target in package.targets {

//         }
//     }
// #endif
// }
// patchToUsePrebuiltXcframeworks(in: &package)