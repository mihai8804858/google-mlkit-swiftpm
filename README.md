# Google MLKit SwiftPM Wrapper

This is experimental project for building MLKit in Swift Package Manager.

## Requirements

- iOS 17 and later
- Xcode 15 and later

## Installation

### Use Swift Package Manager to install

```swift
    dependencies: [
        .package(url: "https://github.com/mihai8804858/google-mlkit-swiftpm", from: "6.0.0"),
    ],
    targets: [
        .target(
            name: "YourTarget",
            dependencies: [
                .product(name: "MLKitLanguageID", package: "google-mlkit-swiftpm"),
                .product(name: "MLKitTranslate", package: "google-mlkit-swiftpm")
            ]
        )
    ]
```

### Add Linker flags

Add these flags to `Other Linker Flags` in Build Settings of your Xcode projects.

- `-ObjC`
- `-all_load`

### Link `.bundle` to your project

The `MLKitTranslate` contains `MLKitTranslate_resource.bundle`. Since the bundle can't be introduced via Swift PM, you need to link to your project by yourself.

Download `MLKitTranslate_resource.bundle` from [Release](https://github.com/mihai8804858/google-mlkit-swiftpm/releases/download/6.1.0/MLKitTranslate_resource.bundle.zip) and add to your Xcode project and make it available in your build target.

## Limitation

- Since pre-built MLKit binary missing `arm64` for iphonesimulator, this project enables to build in `arm64` for iphoneos and `x86_64` for iphonesimulator only.

## Example

Open `Example/Example.xcworkspace` and fixing code signing to yours.
