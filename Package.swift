// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "azure-devops-swift",
    platforms: [.macOS(.v12), .iOS(.v15), .macCatalyst(.v15), .tvOS(.v15), .watchOS(.v8)],
    products: [
        .library(name: "AZCore", targets: ["AZCore"]),
        .library(name: "AZCoreFixtures", targets: ["AZCoreFixtures"]),
        .library(name: "AzureDevops", targets: ["AzureDevops"]),
        .library(name: "AZPipelines", targets: ["AZPipelines"]),
        .library(name: "AZPipelinesFixtures", targets: ["AZPipelinesFixtures"]),
        .library(name: "AZPolicy", targets: ["AZPolicy"]),
        .library(name: "AZPolicyFixtures", targets: ["AZPolicyFixtures"]),
    ],
    dependencies: [
        .customDump,
        .httpTypes,
        .tagged,
    ],
    targets: [
        .target(
            name: "AZCore",
            dependencies: [
                .httpTypes,
                .tagged,
            ]
        ),
        .target(
            name: "AZCoreFixtures",
            dependencies: [
                "AZCore",
            ]
        ),
        .target(
            name: "AzureDevops",
            dependencies: [
                "AZCore",
                "AZPipelines",
                "AZPolicy",
            ]
        ),
        .target(
            name: "AZPipelines",
            dependencies: [
                "AZCore",
            ]
        ),
        .target(
            name: "AZPipelinesFixtures",
            dependencies: [
                "AZCoreFixtures",
                "AZPipelines",
            ]
        ),
        .testTarget(
            name: "AZPipelinesTests",
            dependencies: [
                "AZPipelines",
                "AZPipelinesFixtures",
                .customDump,
                "TestHelpers",
            ]
        ),
        .target(
            name: "AZPolicy",
            dependencies: [
                "AZCore",
            ]
        ),
        .target(
            name: "AZPolicyFixtures",
            dependencies: [
                "AZCoreFixtures",
                "AZPolicy",
            ]
        ),
        .testTarget(
            name: "AZPolicyTests",
            dependencies: [
                "AZPolicy",
                "AZPolicyFixtures",
                .customDump,
                "TestHelpers",
            ]
        ),
        .target(name: "TestHelpers"),
    ]
)

// MARK: custom-dump

extension Package.Dependency {
    static let customDump: Package.Dependency = .package(
        url: "https://github.com/pointfreeco/swift-custom-dump.git",
        from: "1.0.0"
    )
}

extension Target.Dependency {
    static let customDump: Self = .product(name: "CustomDump", package: "swift-custom-dump")
}

// MARK: http-types

extension Package.Dependency {
    static let httpTypes: Package.Dependency = .package(
        url: "https://github.com/apple/swift-http-types.git",
        from: "1.0.0"
    )
}

extension Target.Dependency {
    static let httpTypes: Self = .product(name: "HTTPTypes", package: "swift-http-types")
}

// MARK: tagged

extension Package.Dependency {
    static let tagged: Package.Dependency = .package(
        url: "https://github.com/pointfreeco/swift-tagged.git",
        .upToNextMajor(from: "0.10.0")
    )
}

extension Target.Dependency {
    static let tagged: Self = .product(name: "Tagged", package: "swift-tagged")
}
