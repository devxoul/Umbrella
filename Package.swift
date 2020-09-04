// swift-tools-version:5.0

import PackageDescription

let package = Package(
  name: "Umbrella",
  platforms: [
    .macOS(.v10_11), .iOS(.v8), .tvOS(.v9), .watchOS(.v2)
  ],
  products: [
    .library(name: "Umbrella", targets: ["Umbrella"]),
    .library(name: "UmbrellaAmplitude", targets: ["UmbrellaAmplitude"]),
    .library(name: "UmbrellaAnswers", targets: ["UmbrellaAnswers"]),
    .library(name: "UmbrellaAppboy", targets: ["UmbrellaAppboy"]),
    .library(name: "UmbrellaAppsFlyer", targets: ["UmbrellaAppsFlyer"]),
    .library(name: "UmbrellaFacebook", targets: ["UmbrellaFacebook"]),
    .library(name: "UmbrellaFirebase", targets: ["UmbrellaFirebase"]),
    .library(name: "UmbrellaFlurry", targets: ["UmbrellaFlurry"]),
    .library(name: "UmbrellaIntercom", targets: ["UmbrellaIntercom"]),
    .library(name: "UmbrellaLocalytics", targets: ["UmbrellaLocalytics"]),
    .library(name: "UmbrellaMixpanel", targets: ["UmbrellaMixpanel"]),
    .library(name: "UmbrellaSegment", targets: ["UmbrellaSegment"]),
  ],
  targets: [
    .target(name: "Umbrella"),
    .target(name: "UmbrellaAmplitude", dependencies: ["Umbrella"]),
    .target(name: "UmbrellaAnswers", dependencies: ["Umbrella"]),
    .target(name: "UmbrellaAppboy", dependencies: ["Umbrella"]),
    .target(name: "UmbrellaAppsFlyer", dependencies: ["Umbrella"]),
    .target(name: "UmbrellaFacebook", dependencies: ["Umbrella"]),
    .target(name: "UmbrellaFirebase", dependencies: ["Umbrella"]),
    .target(name: "UmbrellaFlurry", dependencies: ["Umbrella"]),
    .target(name: "UmbrellaIntercom", dependencies: ["Umbrella"]),
    .target(name: "UmbrellaLocalytics", dependencies: ["Umbrella"]),
    .target(name: "UmbrellaMixpanel", dependencies: ["Umbrella"]),
    .target(name: "UmbrellaSegment", dependencies: ["Umbrella"]),
    .testTarget(name: "UmbrellaTests", dependencies: ["Umbrella"]),
    .testTarget(name: "UmbrellaAmplitudeTests", dependencies: ["UmbrellaAmplitude"]),
    .testTarget(name: "UmbrellaAnswersTests", dependencies: ["UmbrellaAnswers"]),
    .testTarget(name: "UmbrellaAppboyTests", dependencies: ["UmbrellaAppboy"]),
    .testTarget(name: "UmbrellaAppsFlyerTests", dependencies: ["UmbrellaAppsFlyer"]),
    .testTarget(name: "UmbrellaFacebookTests", dependencies: ["UmbrellaFacebook"]),
    .testTarget(name: "UmbrellaFirebaseTests", dependencies: ["UmbrellaFirebase"]),
    .testTarget(name: "UmbrellaFlurryTests", dependencies: ["UmbrellaFlurry"]),
    .testTarget(name: "UmbrellaIntercomTests", dependencies: ["UmbrellaIntercom"]),
    .testTarget(name: "UmbrellaLocalyticsTests", dependencies: ["UmbrellaLocalytics"]),
    .testTarget(name: "UmbrellaMixpanelTests", dependencies: ["UmbrellaMixpanel"]),
    .testTarget(name: "UmbrellaSegmentTests", dependencies: ["UmbrellaSegment"]),
  ],
  swiftLanguageVersions: [.v5]
)
