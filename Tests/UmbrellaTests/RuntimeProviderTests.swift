import XCTest
import Umbrella

final class ClassAnalytics: NSObject {
  static var loggedEvents: [(name: String, parameters: [String: Any]?)] = []

  class func logEvent(_ eventName: String, parameters: [String: Any]?) {
    self.loggedEvents.append((name: eventName, parameters: parameters))
  }
}

final class ClassProvider: RuntimeProviderType {
  let className: String = "UmbrellaTests.ClassAnalytics"
  let selectorName: String = "logEvent:parameters:"
}

final class InstanceAnalytics: NSObject {
  static let shared = InstanceAnalytics()
  var loggedEvents: [(name: String, parameters: [String: Any]?)] = []

  @objc func logEvent(_ eventName: String, parameters: [String: Any]?) {
    self.loggedEvents.append((name: eventName, parameters: parameters))
  }
}

final class InstanceProvider: RuntimeProviderType {
  let className: String = "UmbrellaTests.InstanceAnalytics"
  let instanceSelectorName: String? = "shared"
  let selectorName: String = "logEvent:parameters:"
}

final class RuntimeProviderTests: XCTestCase {
  override func setUp() {
    super.setUp()
    ClassAnalytics.loggedEvents.removeAll()
    InstanceAnalytics.shared.loggedEvents.removeAll()
  }

  func testClassProvider() {
    let provider = ClassProvider()
    provider.log("purchase", parameters: ["product_id": 123, "price": 9.99])
    XCTAssertTrue(provider.cls === ClassAnalytics.self)
    XCTAssertEqual(provider.selector, #selector(ClassAnalytics.logEvent(_:parameters:)))
    XCTAssertTrue(provider.responds)
    XCTAssertEqual(ClassAnalytics.loggedEvents.count, 1)
    XCTAssertEqual(ClassAnalytics.loggedEvents[0].name, "purchase")
    XCTAssertEqual(ClassAnalytics.loggedEvents[0].parameters!["product_id"] as! Int, 123)
    XCTAssertEqual(ClassAnalytics.loggedEvents[0].parameters!["price"] as! Double, 9.99)
  }

  func testInstanceProvider() {
    let provider = InstanceProvider()
    provider.log("purchase", parameters: ["product_id": 123, "price": 9.99])
    XCTAssertTrue(provider.cls === InstanceAnalytics.self)
    XCTAssertTrue(provider.instance === InstanceAnalytics.shared)
    XCTAssertEqual(provider.selector, #selector(InstanceAnalytics.logEvent(_:parameters:)))
    XCTAssertTrue(provider.responds)
    XCTAssertEqual(InstanceAnalytics.shared.loggedEvents[0].name, "purchase")
    XCTAssertEqual(InstanceAnalytics.shared.loggedEvents[0].parameters!["product_id"] as! Int, 123)
    XCTAssertEqual(InstanceAnalytics.shared.loggedEvents[0].parameters!["price"] as! Double, 9.99)
  }
}
