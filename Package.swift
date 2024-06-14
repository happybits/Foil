// swift-tools-version:5.10
// The swift-tools-version declares the minimum version
// of Swift required to build this package.
// ----------------------------------------------------
//
//  Created by Jesse Squires
//  https://www.jessesquires.com
//
//  Documentation
//  https://jessesquires.github.io/Foil
//
//  GitHub
//  https://github.com/jessesquires/Foil
//
//  Copyright © 2021-present Jesse Squires
//

import PackageDescription

let package = Package(
    name: "Foil",
    platforms: [
        .iOS(.v13),
        .tvOS(.v13),
        .watchOS(.v6),
        .macOS(.v11),
        .visionOS(.v1)
    ],
    products: [
        .library(
            name: "Foil",
            targets: ["Foil"])
    ],
    targets: [
        .target(
            name: "Foil",
            path: "Sources"),
        .testTarget(name: "FoilTests",
                    dependencies: ["Foil"],
                    path: "Tests")
    ],
    swiftLanguageVersions: [.v5]
)

#warning("Remove this when it stops being broken. Xcode 16? Swift 6?")
let swiftSettings = [
    SwiftSetting.enableExperimentalFeature("StrictConcurrency")
]

for target in package.targets {
    var settings = target.swiftSettings ?? []
    settings.append(contentsOf: swiftSettings)
    target.swiftSettings = settings
}
