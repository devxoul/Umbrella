// swift-tools-version:3.1

import PackageDescription

let package = Package(
  name: "Umbrella",
  targets: [
    Target(name: "Umbrella"),
    Target(name: "UmbrellaFirebase", dependencies: ["Umbrella"]),
  ]
)
