// swift-tools-version: 5.9

import PackageDescription

let package = Package(
  name: "Example",
  platforms: [.iOS(.v16)],
  products: [
    .library(
      name: "Camera",
      targets: ["Camera"])
  ],
  dependencies: [
    .package(path: "../../"),
  ],
  targets: [
    .target(
      name: "Camera",
      dependencies: [
        .product(name: "MLKitTranslate", package: "MLKitTranslate"),
      ]),
    .testTarget(
      name: "CameraTests",
      dependencies: ["Camera"]),
  ]
)
