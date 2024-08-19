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
      checksum: "d9f3fa65313974c7bbda3c163e2f0ceb265ec066dedd49ce29b8b0f059366671"
    ),
    .binaryTarget(
      name: "MLKitTranslate",
      url: "https://github.com/mihai8804858/google-mlkit-swiftpm/releases/download/6.0.0/MLKitTranslate.xcframework.zip",
      checksum: "106865d3a4c2da222f0676411fdd82fc0d9b025e562b943a26e05df84a4cb62e"
    ),
    .binaryTarget(
      name: "MLKitNaturalLanguage",
      url: "https://github.com/mihai8804858/google-mlkit-swiftpm/releases/download/6.0.0/MLKitNaturalLanguage.xcframework.zip",
      checksum: "907bad37cb095636ca9badb0fb19d6049dd326e538b8cb25bd5742f75741f614"
    ),
    .binaryTarget(
      name: "MLKitCommon",
      url: "https://github.com/mihai8804858/google-mlkit-swiftpm/releases/download/6.0.0/MLKitCommon.xcframework.zip",
      checksum: "b90d62be7ee60f394504db53f288d848bda804b95c62e3cfc72439fe9f1fc18f"
    ),
    .binaryTarget(
      name: "GoogleUtilitiesComponents",
      url: "https://github.com/mihai8804858/google-mlkit-swiftpm/releases/download/6.0.0/GoogleUtilitiesComponents.xcframework.zip",
      checksum: "b67e51f9a3da69716451b32d9f6e64c70649d7d2b6e5ad48ab9ce4ee47c05c47"
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
