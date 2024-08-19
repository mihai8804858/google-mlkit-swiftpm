// swift-tools-version: 5.9

import PackageDescription

let package = Package(
  name: "GoogleMLKitSwiftPM",
  platforms: [.iOS(.v16)],
  products: [
    .library(
        name: "MLKitTranslate",
        targets: ["MLKitTranslate", "MLKitNaturalLanguage", "Common"]),
    .library(
        name: "MLKitNaturalLanguage",
        targets: ["MLKitNaturalLanguage", "Common"]),
  ],
  dependencies: [
    .package(url: "https://github.com/google/promises.git", exact: "2.4.0"),
    .package(url: "https://github.com/google/GoogleDataTransport.git", exact: "9.4.0"),
    .package(url: "https://github.com/google/GoogleUtilities.git", exact: "7.13.2"),
    .package(url: "https://github.com/google/gtm-session-fetcher.git", exact: "3.4.1"),
    .package(url: "https://github.com/firebase/nanopb.git", exact: "2.30910.0"),
    .package(url: "https://github.com/ZipArchive/ZipArchive.git", .upToNextMajor(from: "2.5.5")),
  ],
  targets: [
    .binaryTarget(
      name: "GoogleToolboxForMac",
      url: "https://github.com/mihai8804858/google-mlkit-swiftpm/releases/download/6.0.0/GoogleToolboxForMac.xcframework.zip",
      checksum: "0814fbc719d97ae26328d7395e0d8fa7bdf1ad1c93731cec2a71b5f9c19a8c90"
    ),
    .binaryTarget(
      name: "MLKitTranslate",
      url: "https://github.com/mihai8804858/google-mlkit-swiftpm/releases/download/6.0.0/MLKitTranslate.xcframework.zip",
      checksum: "952b22652d3fea09006df084c5a48b854e26b3ff0b83676ec8b9ade7acfbe43b"
    ),
    .binaryTarget(
      name: "MLKitNaturalLanguage",
      url: "https://github.com/mihai8804858/google-mlkit-swiftpm/releases/download/6.0.0/MLKitNaturalLanguage.xcframework.zip",
      checksum: "cdf6710592406f8f9814cdb6c4ed6167a48dce1b4fd6c20665a1da13f64913be"
    ),
    .binaryTarget(
      name: "MLKitCommon",
      url: "https://github.com/mihai8804858/google-mlkit-swiftpm/releases/download/6.0.0/MLKitCommon.xcframework.zip",
      checksum: "bd9d76d733d9336ce965ed4549900be6661086417a2c437dbb2b6269df692c43"
    ),
    .binaryTarget(
      name: "GoogleUtilitiesComponents",
      url: "https://github.com/mihai8804858/google-mlkit-swiftpm/releases/download/6.0.0/GoogleUtilitiesComponents.xcframework.zip",
      checksum: "59855e6f37aa5ca81c67574b11d9295bafc24ceef68e3e7981a9a2748d2a5246"
    ),
    .target(
      name: "Common",
      dependencies: [
        "MLKitCommon",
        "GoogleToolboxForMac",
        "GoogleUtilitiesComponents",
        .product(name: "GULAppDelegateSwizzler", package: "GoogleUtilities"),
        .product(name: "GULEnvironment", package: "GoogleUtilities"),
        .product(name: "GULISASwizzler", package: "GoogleUtilities"),
        .product(name: "GULLogger", package: "GoogleUtilities"),
        .product(name: "GULMethodSwizzler", package: "GoogleUtilities"),
        .product(name: "GULNSData", package: "GoogleUtilities"),
        .product(name: "GULNetwork", package: "GoogleUtilities"),
        .product(name: "GULReachability", package: "GoogleUtilities"),
        .product(name: "GULUserDefaults", package: "GoogleUtilities"),
        .product(name: "GTMSessionFetcher", package: "gtm-session-fetcher"),
        .product(name: "GoogleDataTransport", package: "GoogleDataTransport"),
        .product(name: "nanopb", package: "nanopb"),
        .product(name: "FBLPromises", package: "promises"),
        .product(name: "ZipArchive", package: "ZipArchive"),
      ]
    ),
  ]
)
