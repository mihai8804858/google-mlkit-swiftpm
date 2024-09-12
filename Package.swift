// swift-tools-version: 5.9

import PackageDescription

let package = Package(
  name: "GoogleMLKitSwiftPM",
  platforms: [.iOS(.v17), .macOS(.v13)],
  products: [
    .library(
      name: "MLKitTranslate",
      targets: ["MLKitTranslate", "MLKitNaturalLanguage", "Common"]
    ),
    .library(
        name: "MLKitLanguageID",
        targets: ["MLKitLanguageID", "MLKitNaturalLanguage", "Common"]
    ),
    .library(
      name: "MLKitNaturalLanguage",
      targets: ["MLKitNaturalLanguage", "Common"]
    )
  ],
  dependencies: [
    .package(url: "https://github.com/google/promises.git", exact: "2.4.0"),
    .package(url: "https://github.com/google/GoogleDataTransport.git", exact: "9.4.0"),
    .package(url: "https://github.com/google/GoogleUtilities.git", exact: "7.13.2"),
    .package(url: "https://github.com/google/gtm-session-fetcher.git", exact: "3.4.1"),
    .package(url: "https://github.com/firebase/nanopb.git", exact: "2.30910.0"),
    .package(url: "https://github.com/ZipArchive/ZipArchive.git", .upToNextMajor(from: "2.5.5"))
  ],
  targets: [
    .binaryTarget(
      name: "GoogleToolboxForMac",
      url: "https://github.com/mihai8804858/google-mlkit-swiftpm/releases/download/6.1.0/GoogleToolboxForMac.xcframework.zip",
      checksum: "20e685c6a07c01e79c20e51e8ac7efe40c3b931f35c51d12bee72234e825be3d"
    ),
    .binaryTarget(
      name: "GoogleUtilitiesComponents",
      url: "https://github.com/mihai8804858/google-mlkit-swiftpm/releases/download/6.1.0/GoogleUtilitiesComponents.xcframework.zip",
      checksum: "d1aafd7642a0c5d30231e694e3f277428e7b979bf31c71db3fa8a5b3ca58d16d"
    ),
    .binaryTarget(
      name: "MLKitCommon",
      url: "https://github.com/mihai8804858/google-mlkit-swiftpm/releases/download/6.1.0/MLKitCommon.xcframework.zip",
      checksum: "859b2afa79e91ca12daf04324f82e6cc0debdb125f4465d31a93bd273c90df2f"
    ),
    .binaryTarget(
      name: "MLKitNaturalLanguage",
      url: "https://github.com/mihai8804858/google-mlkit-swiftpm/releases/download/6.1.0/MLKitNaturalLanguage.xcframework.zip",
      checksum: "0c20eb9ff52d05725b99ebbe4dfdb11486cc19a76316d42993c53416a06a9a2b"
    ),
    .binaryTarget(
      name: "MLKitTranslate",
      url: "https://github.com/mihai8804858/google-mlkit-swiftpm/releases/download/6.1.0/MLKitTranslate.xcframework.zip",
      checksum: "d9456df183ae0fdd3484b7b6ccc0dd5f2a3e3183a97a069e2d12675f576339f2"
    ),
    .binaryTarget(
      name: "MLKitLanguageID",
      url: "https://github.com/mihai8804858/google-mlkit-swiftpm/releases/download/6.1.0/MLKitLanguageID.xcframework.zip",
      checksum: "c0ad54670685fa58af3cb47b6533fdf7127cd88714cea104b217c4240c470ace"
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
        .product(name: "ZipArchive", package: "ZipArchive")
      ]
    )
  ]
)
