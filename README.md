# ☂️ Umbrella

![Swift](https://img.shields.io/badge/Swift-4.0-orange.svg)
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

To create a Xcode workspace:

```bash
$ make project
```

This will automatically create **`Umbrella.xcworkspace`** and perform `pod install`.

## License

Umbrella is under MIT license. See the [LICENSE](LICENSE) file for more info.
