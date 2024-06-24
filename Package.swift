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
//    .binaryTarget(
//        name: "MLKitTranslate",
//        path: "xcframework-maker/output/path/MLKitTranslate.xcframework"),
//    .binaryTarget(
//        name: "MLKitNaturalLanguage",
//        path: "xcframework-maker/output/path/MLKitNaturalLanguage.xcframework"),
//    .binaryTarget(
//        name: "GoogleToolboxForMac",
//        path: "xcframework-maker/output/path/GoogleToolboxForMac.xcframework"),
    
    .binaryTarget(
        name: "GoogleToolboxForMac",
        url: "https://github.com/roMummy/google-mlkit-swiftpm/releases/download/6.0.0/GoogleToolboxForMac.xcframework.zip",
        checksum: "5a4433a64a431ed1a9586572b74f93ae194479597f015a2c18a3adfe21f34490"),
    
    .binaryTarget(
        name: "MLKitTranslate",
        url: "https://github.com/roMummy/google-mlkit-swiftpm/releases/download/6.0.0/MLKitTranslate.xcframework.zip",
        checksum: "16b201f9a90ad8d832a02037f56252677be8d9713c39328e48b41667549f1f56"),
    
    .binaryTarget(
        name: "MLKitNaturalLanguage",
        url: "https://github.com/roMummy/google-mlkit-swiftpm/releases/download/6.0.0/MLKitNaturalLanguage.xcframework.zip",
        checksum: "537f377c28221d84a2812f75443183b924eb75af416813755ce8b95e5a8613d5"),
    
    
    .binaryTarget(
      name: "MLKitCommon",
      url:
        "https://github.com/d-date/google-mlkit-swiftpm/releases/download/6.0.0/MLKitCommon.xcframework.zip",
      checksum: "5917182923f1ca880b79c8b00c4e7b19f4192ce204c1ab62289f35c47074f239"),
    .binaryTarget(
      name: "GoogleUtilitiesComponents",
      url:
        "https://github.com/d-date/google-mlkit-swiftpm/releases/download/6.0.0/GoogleUtilitiesComponents.xcframework.zip",
      checksum: "f34db62a980a77f68ee1ccb995edffdf5e68a758a521cdcd203bff5efb2d1722"),

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
