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
xcodebuild -scheme ios-app -workspace ios-app.xcworkspace -configuration Debug build CODE_SIGNING_REQUIRED=NO
git status