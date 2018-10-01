# ☂️ Umbrella

![Swift](https://img.shields.io/badge/Swift-4.2-orange.svg)
[![CocoaPods](http://img.shields.io/cocoapods/v/Umbrella.svg)](https://cocoapods.org/pods/Umbrella)
[![Build Status](https://travis-ci.org/devxoul/Umbrella.svg?branch=master)](https://travis-ci.org/devxoul/Umbrella)
[![Codecov](https://img.shields.io/codecov/c/github/devxoul/Umbrella.svg)](https://codecov.io/gh/devxoul/Umbrella)

Analytics abstraction layer for Swift. Inspired by [Moya](https://github.com/Moya/Moya).

## Table of Contents

* [Why?](#why)
* [Features](#features)
* [At a Glance](#at-a-glance)
* [Getting Started](#getting-started)
    * [Defining Events](#defining-events)
    * [Using Analytics](#using-analytics)
    * [Built-in Providers](#built-in-providers)
    * [Creating Custom Providers](#creating-custom-providers)
* [Installation](#installation)
* [Contributing](#contributing)
    * [Generating Xcode Workspace](#generating-xcode-workspace)
    * [Creating New Provider](#creating-new-provider)
* [License](#license)

## Why?

There are many tools for mobile app analytics such as Firebase, Google Analytics, Fabric Answers, Flurry, Mixpanel, etc. You might use one or more of those in your application. But most of those SDKs have some problems: if you use multiple analytics tools, your code will be messed up. And the SDKs take event name as a string and parameters as a dictionary which is not guaranteed by Swift compiler. It means that if you change the event definition, you should find all related code by your hand. It has an opportunity that cause a human error. **Umbrella uses Swift enums and the associated values to solve these problems.**

## Features

* 💪 Taking advantages of Swift compiler by using an enum and associated values.
* 🎯 Logging events to multiple analytics providers at once.
* 🎨 Creating custom analytics providers.

## At a Glance

**Before** 🤢

```swift
FIRAnalytics.logEvent(withName: kFIREventEcommercePurchase, parameters: [
  kFIRParameterCurrency: "USD" as NSObject,
  kFIRParameterValue: 9.99 as NSNumber,
  kFIRParameterTransactionID: "20170709123456" as NSObject,
])
Flurry.logEvent("purchase", withParameters: [
  "Currency": "USD",
  "Price": 9.99,
  "Transaction ID": "20170709123456"
])
MyCustomAnalytics.logEvent("purchase", withParameters: [
  "currency": "USD",
  "price": 9.99,
  "transaction_id": "20170709123456"
])
```

**After** 😊

```swift
let analytics = Analytics<MyAppEvent>()
analytics.register(provider: FirebaseProvider())
analytics.register(provider: FlurryProvider())
analytics.register(provider: MyCustomProvider())
analytics.log(.purchase(currency: "USD", price: 9.99, transactionID: "20170709123456"))
```

## Getting Started

### Defining Events

First of all, you should define all of your events in a single enum. Let's assume that we have three events that have associated parameters.

```swift
enum MyAppEvent {
  case signup(username: String)
  case viewContent(productID: Int)
  case purchase(productID: Int, price: Float)
}
```

Then make the enum to conform the protocol `EventType`. It requires two functions: `name(for:)` and `parameters(for:)`.

```swift
extension MyAppEvent: EventType {
  /// An event name to be logged
  func name(for provider: ProviderType) -> String? {
    switch self {
    case .signup: return "signup"
    case .viewContent: return "view_content"
    case .purchase: return "purchase"
    }
  }

  /// Parameters to be logged
  func parameters(for provider: ProviderType) -> [String: Any]? {
    switch self {
    case let .signup(username):
      return ["username": username]
    case let .viewContent(productID):
      return ["product_id": productID]
    case let .purchase(productID, price):
      return ["product_id": productID, "price": price]
    }
  }
}
```

You can even provide different event names and parameters by `provider`s.

### Using Analytics

You can define an `Analytics` instance anywhere but it's recommended to define at a global scope.

```swift
let analytics = Analytics<MyAppEvent>()
```

Then you should register providers. A prodiver is a wrapper for an actual analytics service such as Firebase and Fabric Answers. It's recommended to register providers in `application(_:didFinishLaunchingWithOptions:)`.

```swift
analytics.register(provider: AnswersProvider())
analytics.register(provider: FirebaseProvider())
analytics.register(provider: FlurryProvider())
analytics.register(provider: MyAwesomeProvider())
```

If you finished those steps, you can now log the events 🎉

```swift
analytics.log(.signup(username: "devxoul"))
```

### Built-in Providers

There are several built-in providers.

* AmplitudeProvider ([Amplitude-iOS](https://cocoapods.org/pods/Amplitude-iOS))
* AnswersProvider ([Answers](https://cocoapods.org/pods/Answers))
* AppboyProvider ([Appboy-iOS-SDK](http://cocoapods.org/pods/Appboy-iOS-SDK))
* AppsFlyerProvider ([AppsFlyerFramework](http://cocoapods.org/pods/AppsFlyerFramework))
* FirebaseProvider ([Firebase/Analytics](https://cocoapods.org/pods/Firebase))
* FlurryProvider ([Flurry-iOS-SDK/FabricSDK](https://cocoapods.org/pods/Flurry-iOS-SDK))
* LocalyticsProvider ([Localytics](https://cocoapods.org/pods/Localytics))
* MixpanelProvider ([Mixpanel](https://cocoapods.org/pods/Mixpanel))

If there's no provider you're looking for, you can [create an issue](https://github.com/devxoul/Umbrella/issues/new) or [create custom providers](#creating-custom-providers). It's also welcomed to create a pull request for missing services 🎉

### Creating Custom Providers

If there's no built-in provider for the serivce you're using, you can also create your own. It's easy to create a provider: just create a class and conform to the protocol `ProviderType`.

```swift
final class MyAwesomeProvider: ProviderType {
  func log(_ eventName: String, parameters: [String: Any]?) {
    AwesomeAnalytics.logEvent(withName: eventName, parameters: parameters)
  }
}
```

## Installation

Umbrella currently support [CocoaPods](https://cocoapods.org) only.

```ruby
pod 'Umbrella'
pod 'Umbrella/Firebase' # using with built-in FirebaseProvider
pod 'Umbrella/...'
```

## Contributing

Any discussions and pull requests are welcomed 💖

### Generating Xcode Workspace

```bash
$ make project
```

This will automatically generate **`Umbrella.xcworkspace`** and perform `pod install`.

### Creating New Provider

For example, imagine that we are going to create a new provider for an analytics service 'Raincoat'.

1. Add a library and a target definition in **`Package.swift`**.

    ```diff
      let package = Package(
        name: "Umbrella",
        products: [
          .library(name: "Umbrella", targets: ["Umbrella"]),
          .library(name: "UmbrellaFirebase", targets: ["UmbrellaFirebase"]),
          .library(name: "UmbrellaMixpanel", targets: ["UmbrellaMixpanel"]),
    +     .library(name: "UmbrellaRaincoat", targets: ["UmbrellaRaincoat"]),
        ],
        targets: [
          .target(name: "Umbrella"),
          .target(name: "UmbrellaFirebase", dependencies: ["Umbrella"]),
          .target(name: "UmbrellaMixpanel", dependencies: ["Umbrella"]),
    +     .target(name: "UmbrellaRaincoat", dependencies: ["Umbrella"]),
          .testTarget(name: "UmbrellaTests", dependencies: ["Umbrella"]),
          .testTarget(name: "UmbrellaFirebaseTests", dependencies: ["UmbrellaFirebase"]),
          .testTarget(name: "UmbrellaMixpanelTests", dependencies: ["UmbrellaMixpanel"]),
    +     .testTarget(name: "UmbrellaRaincoat", dependencies: ["UmbrellaRaincoat"]),
        ]
      )
    ```

2. Add a source file and a test file.

    ```diff
      ...
      ├── Sources
      │   ├── UmbrellaFirebase
      │   │   └── FirebaseProvider.swift
      │   ├── UmbrellaMixpanel
      │   │   └── MixpanelProvider.swift
    + │   ├── UmbrellaRaincoat
    + │   │   └── RaincoatProvider.swift
      |   ...
      ├── Tests
      │   ├── UmbrellaFirebaseTests
      │   │   └── FirebaseProviderTests.swift
      │   ├── UmbrellaMixpanelTests
      │   │   └── MixpanelProviderTests.swift
    + │   ├── UmbrellaRaincoatTests
    + │   │   └── RaincoatProviderTests.swift
      ... ...
    ```

3. Add a CocoaPods dependency in **`Podfile`**.

    ```diff
     target 'UmbrellaFirebaseTests' do
       platform :ios, '8.0'
       pod 'Firebase/Analytics'
     end

     target 'UmbrellaMixpanelTests' do
       platform :ios, '8.0'
       pod 'Mixpanel'
     end

    + target 'UmbrellaRaincoatTests' do
    +   platform :ios, '8.0'
    +   pod 'Raincoat'
    + end
    ```

4. Add a CocoaPods subspec in **`Umbrella.podspec`**.

    ```diff
      s.subspec "Firebase" do |ss|
        ss.source_files = "Sources/UmbrellaFirebase/*.swift"
        ss.dependency "Umbrella/Core"
      end

      s.subspec "Mixpanel" do |ss|
        ss.source_files = "Sources/UmbrellaMixpanel/*.swift"
        ss.dependency "Umbrella/Core"
      end

    + s.subspec "Raincoat" do |ss|
    +   ss.source_files = "Sources/UmbrellaRaincoat/*.swift"
    +   ss.dependency "Umbrella/Core"
    + end
    ```

5. Create a Xcode workspace and run tests. Don't forget to check the code coverage to ensure that tests can cover the new provider.

    ```console
    $ make project
    ```

## License

Umbrella is under MIT license. See the [LICENSE](LICENSE) file for more info.
