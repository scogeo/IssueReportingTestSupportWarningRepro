// swift-tools-version: 6.4

import PackageDescription

let package = Package(
  name: "repro-package",
  platforms: [.iOS("27.2"), .macOS("27.2"), .visionOS("27.2")],
  products: [
    .library(name: "AppFeature", targets: ["AppFeature"])
  ],
  dependencies: [
    .package(url: "https://github.com/pointfreeco/swift-dependencies", exact: "1.17.2")
  ],
  targets: [
    .target(
      name: "AppFeature",
      dependencies: [.product(name: "Dependencies", package: "swift-dependencies")]
    ),
    .testTarget(
      name: "AppFeatureTests",
      dependencies: [
        "AppFeature",
        .product(name: "DependenciesTestSupport", package: "swift-dependencies"),
      ]
    ),
  ]
)
