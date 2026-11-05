# IssueReportingTestSupport warning repro

Minimal reproduction of linker warnings when building `IssueReportingTestSupport` with Xcode 27.2. A local package uses `Dependencies` in `AppFeature` and `DependenciesTestSupport` in a single Swift Testing test, which pulls in `IssueReportingTestSupport` transitively.

The app and test build successfully, but linking `IssueReportingTestSupport` produces these warnings:

```text
ld: warning: building for iOS-simulator-15.0, but linking with dylib '@rpath/Testing.framework/Testing' which was built for newer version 17.0
ld: warning: building for iOS-simulator-15.0, but linking with dylib '@rpath/libXCTestSwiftSupport.dylib' which was built for newer version 17.0
```

## Reproduce

Use Xcode 27.2 with the iOS 27.2 Simulator runtime installed and Xcode selected as the active command-line developer directory. From the repository root, run:

```sh
xcodebuild \
  -project IssueReportingTestSupportWarningRepro.xcodeproj \
  -scheme IssueReportingTestSupportWarningRepro \
  -destination 'platform=iOS Simulator,name=iPhone 18 Pro,OS=27.2' \
  -derivedDataPath /tmp/IssueReportingWarningRepro-DerivedData \
  clean test
```

Replace the simulator name if necessary. Available destinations can be listed with:

```sh
xcodebuild \
  -project IssueReportingTestSupportWarningRepro.xcodeproj \
  -scheme IssueReportingTestSupportWarningRepro \
  -showdestinations
```

Alternatively, open `IssueReportingTestSupportWarningRepro.xcodeproj` in Xcode, select the `IssueReportingTestSupportWarningRepro` scheme and an iOS 27.2 simulator, then choose **Product → Test**. If the dependencies have already been built, choose **Product → Clean Build Folder** before testing to emit the linker warnings again.

Expected result: one passing test and both linker warnings above. The clean build ensures the dependency is linked again so the warnings are emitted.

Resolved versions: `swift-dependencies` 1.17.2 and `swift-issue-reporting` 2.1.2. The checked-in `Package.resolved` pins the transitive dependencies.
