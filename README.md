# EventAnalytics

![Swift](https://img.shields.io/badge/Swift-3.1-orange.svg)
[![CocoaPods](http://img.shields.io/cocoapods/v/EventAnalytics.svg)](https://cocoapods.org/pods/EventAnalytics)
[![Build Status](https://travis-ci.org/devxoul/EventAnalytics.svg?branch=master)](https://travis-ci.org/devxoul/EventAnalytics)
[![Codecov](https://img.shields.io/codecov/c/github/devxoul/EventAnalytics.svg)](https://codecov.io/gh/devxoul/EventAnalytics)

Analytics abstraction layer for Swift. Inspired by [Moya](https://github.com/Moya/Moya).

## Why?

There are many tools for mobile app analytics such as Firebase, Google Analytics, Fabric Answers, Flurry, Mixpanel, etc. You might use one or more of those in your application. But most of those SDKs have some problems: if you use multiple analytics tools, your code will be messed up. And the SDKs take event name as a string and parameters as a dictionary which is not guaranteed by Swift compiler. It means that if you change the event definition, you should find all related code by your hand. It has an opportunity that cause a human error. **EventAnalytics uses Swift enums and the associated values to solve these problems.**

## Features

* 💪 Taking advantages of Swift compiler by using an enum and associated values.
* 🎯 Logging events to multiple analytics providers at once.
* 🎨 Creating custom analytics providers.

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
  func name(for provider: ProviderType) -> String {
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

### Adding Providers

A prodiver represents an actual analytics service provider. Firebase, Google Analytics and other services can become providers. It's easy to create a provider: just create a class and conform to the protocol `ProviderType`.

```swift
final class FirebaseProvider: ProviderType {
  func log(_ eventName: String, parameters: [String: Any]?) {
    FIRAnalytics.logEvent(withName: eventName, parameters: parameters)
  }
}
```

> **Note**: At this time EventAnalytics doesn't provide default providers but it will provide popular provider classes in the future.

### Creating Analytics

The last step is to create an instance of `Analytics`. You can define it anywhere but I'd recommended to create an instance as a global constant and register providers in `application(_:didFinishLaunchingWithOptions:)`.

```swift
let analytics = Analytics<MyAppEvent>()
analytics.register(provider: FirebaseProvider())
analytics.register(provider: GoogleAnalyticsProvider())
analytics.register(provider: FlurryProvider())
analytics.register(provider: MyCustomProvider())
```

With this instance, you can log the events 🎉

```swift
analytics.log(.signup(username: "devxoul"))
```

## Installation

* **Using [CocoaPods](https://cocoapods.org)**:

    ```ruby
    pod 'EventAnalytics'
    ```

* **Using [Carthage](https://github.com/Carthage/Carthage)**:

    ```
    github "devxoul/EventAnalytics"
    ```

## License

EventAnalytics is under MIT license. See the [LICENSE](LICENSE) file for more info.
