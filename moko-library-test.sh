rm -rf moko-library-test
shaper-cli -i moko-library.yaml -o moko-library-test
cd moko-library-test
chmod +x gradlew
git init
git add .
git commit -m "initial commit"
./gradlew build syncMultiPlatformLibraryDebugFrameworkIosX64
cd sample/ios-app
pod install
xcodebuild xcodebuild -scheme ios-app -workspace ios-app.xcworkspace -configuration Debug -sdk iphonesimulator -arch x86_64 build CODE_SIGNING_REQUIRED=NO CODE_SIGNING_ALLOWED=NO | xcpretty
git status