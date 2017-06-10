import XCTest
import Umbrella

final class ClassAnalytics: NSObject {
  class func logEvent(_ eventName: String, parameters: [String: Any]?) {
  }
}

final class ClassProvider: RuntimeProviderType {
  let className: String = "UmbrellaTests.ClassAnalytics"
  let selectorName: String = "logEvent:parameters:"
}

final class InstanceAnalytics: NSObject {
  static let shared = InstanceAnalytics()
  func logEvent(_ eventName: String, parameters: [String: Any]?) {
  }
}

final class InstanceProvider: RuntimeProviderType {
  let className: String = "UmbrellaTests.InstanceAnalytics"
  let instanceSelectorName: String? = "shared"
  let selectorName: String = "logEvent:parameters:"
}

final class RuntimeProviderTests: XCTestCase {
  func testClassProvider() {
    let provider = ClassProvider()
    XCTAssertTrue(provider.cls === ClassAnalytics.self)
    XCTAssertEqual(provider.selector, #selector(ClassAnalytics.logEvent(_:parameters:)))
    XCTAssertTrue(provider.responds)
  }

  func testInstanceProvider() {
    let provider = InstanceProvider()
    XCTAssertTrue(provider.cls === InstanceAnalytics.self)
    XCTAssertTrue(provider.instance === InstanceAnalytics.shared)
    XCTAssertEqual(provider.selector, #selector(InstanceAnalytics.logEvent(_:parameters:)))
    XCTAssertTrue(provider.responds)
  }
}
