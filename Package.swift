// swift-tools-version:3.1

import PackageDescription

let package = Package(
  name: "Umbrella",
  targets: [
    Target(name: "Umbrella"),
    Target(name: "UmbrellaAnswers", dependencies: ["Umbrella"]),
    Target(name: "UmbrellaAppboy", dependencies: ["Umbrella"]),
    Target(name: "UmbrellaAppsFlyer", dependencies: ["Umbrella"]),
    Target(name: "UmbrellaFirebase", dependencies: ["Umbrella"]),
    Target(name: "UmbrellaFlurry", dependencies: ["Umbrella"]),
    Target(name: "UmbrellaLocalytics", dependencies: ["Umbrella"]),
    Target(name: "UmbrellaMixpanel", dependencies: ["Umbrella"]),
  ]
)
