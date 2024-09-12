PROJECT_ROOT=$(cd $(dirname $0); cd ..; pwd)
PODS_ROOT="./Pods"
PODS_PROJECT="$(PODS_ROOT)/Pods.xcodeproj"
SYMROOT="$(PODS_ROOT)/Build"
IPHONEOS_DEPLOYMENT_TARGET = 17.0

bootstrap-cocoapods:
	@bundle install
	@bundle exec pod install

bootstrap-builder:
	@cd xcframework-maker && swift build -c release

build-cocoapods: bootstrap-cocoapods
	@xcodebuild \
		-project "$(PODS_PROJECT)" \
		-sdk iphoneos \
		-configuration Release \
		-alltargets \
  		ONLY_ACTIVE_ARCH=NO \
  		ENABLE_TESTABILITY=NO \
  		SYMROOT="$(SYMROOT)" \
  		CLANG_ENABLE_MODULE_DEBUGGING=NO \
		IPHONEOS_DEPLOYMENT_TARGET="$(IPHONEOS_DEPLOYMENT_TARGET)" | xcpretty
	@xcodebuild \
		-project "$(PODS_PROJECT)" \
		-sdk iphonesimulator \
		-configuration Release \
		-alltargets \
  		ONLY_ACTIVE_ARCH=NO \
  		ENABLE_TESTABILITY=NO \
  		SYMROOT="$(SYMROOT)" \
  		CLANG_ENABLE_MODULE_DEBUGGING=NO \
		IPHONEOS_DEPLOYMENT_TARGET="$(IPHONEOS_DEPLOYMENT_TARGET)" | xcpretty

prepare-info-plist:
	@cp -rf "./Resources/MLKitCommon-Info.plist" "./Pods/MLKitCommon/Frameworks/MLKitCommon.framework/Info.plist"
	@cp -rf "./Resources/MLKitTranslate-Info.plist" "./Pods/MLKitTranslate/Frameworks/MLKitTranslate.framework/Info.plist"
	@cp -rf "./Resources/MLKitLanguageID-Info.plist" "./Pods/MLKitLanguageID/Frameworks/MLKitLanguageID.framework/Info.plist"
	@cp -rf "./Resources/MLKitNaturalLanguage-Info.plist" "./Pods/MLKitNaturalLanguage/Frameworks/MLKitNaturalLanguage.framework/Info.plist"

create-xcframework: bootstrap-builder build-cocoapods prepare-info-plist
	@rm -rf GoogleMLKit
	@xcodebuild -create-xcframework \
		-framework Pods/Pods/Build/Release-iphonesimulator/GoogleToolboxForMac/GoogleToolboxForMac.framework \
		-framework Pods/Pods/Build/Release-iphoneos/GoogleToolboxForMac/GoogleToolboxForMac.framework \
		-output GoogleMLKit/GoogleToolboxForMac.xcframework
	@xcodebuild -create-xcframework \
		-framework Pods/Pods/Build/Release-iphonesimulator/GoogleUtilitiesComponents/GoogleUtilitiesComponents.framework \
		-framework Pods/Pods/Build/Release-iphoneos/GoogleUtilitiesComponents/GoogleUtilitiesComponents.framework \
		-output GoogleMLKit/GoogleUtilitiesComponents.xcframework
	@xcframework-maker/.build/release/make-xcframework \
	-ios ./Pods/MLKitCommon/Frameworks/MLKitCommon.framework \
	-output GoogleMLKit
	@xcframework-maker/.build/release/make-xcframework \
	-ios ./Pods/MLKitNaturalLanguage/Frameworks/MLKitNaturalLanguage.framework \
	-output GoogleMLKit
	@xcframework-maker/.build/release/make-xcframework \
	-ios ./Pods/MLKitLanguageID/Frameworks/MLKitLanguageID.framework \
	-output GoogleMLKit
	@xcframework-maker/.build/release/make-xcframework \
	-ios ./Pods/MLKitTranslate/Frameworks/MLKitTranslate.framework \
	-output GoogleMLKit

archive: create-xcframework
	@cd ./GoogleMLKit \
	 && zip -r GoogleToolboxForMac.xcframework.zip GoogleToolboxForMac.xcframework \
	 && zip -r GoogleUtilitiesComponents.xcframework.zip GoogleUtilitiesComponents.xcframework \
	 && zip -r MLKitCommon.xcframework.zip MLKitCommon.xcframework \
	 && zip -r MLKitNaturalLanguage.xcframework.zip MLKitNaturalLanguage.xcframework \
	 && zip -r MLKitLanguageID.xcframework.zip MLKitLanguageID.xcframework \
	 && zip -r MLKitTranslate.xcframework.zip MLKitTranslate.xcframework

.PHONY:

run: archive
