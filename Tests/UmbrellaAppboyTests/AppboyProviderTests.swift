import XCTest
import Umbrella
import UmbrellaAppboy
import Appboy_iOS_SDK

final class AppboyProviderTests: XCTestCase {
  private enum Swizzle {
    static let UNUserNotificationCenter_currentNotificationCenter: Void = {
      guard #available(iOS 10.0, *) else { return }
      let cls = UNUserNotificationCenter.self
      let oldSelector = NSSelectorFromString("currentNotificationCenter")
      let newSelector = #selector(UNUserNotificationCenter.swizzled_currentNotificationCenter)
      guard let oldMethod = class_getClassMethod(cls, oldSelector) else { return }
      guard let newMethod = class_getClassMethod(cls, newSelector) else { return }
      method_exchangeImplementations(oldMethod, newMethod)
    }()
  }

  override func setUp() {
    super.setUp()
    Swizzle.UNUserNotificationCenter_currentNotificationCenter
    Appboy.start(withApiKey: "TEST_TOKEN", in: UIApplication.shared, withLaunchOptions: [:], withAppboyOptions: [:])
  }

  func testAppboyProvider() {
    let provider = AppboyProvider()
    XCTAssertTrue(provider.cls === Appboy.self)
    XCTAssertNotNil(provider.instance)
    XCTAssertTrue(provider.instance === Appboy.sharedInstance())
    XCTAssertEqual(provider.selector, #selector(Appboy.logCustomEvent(_:withProperties:)))
    XCTAssertTrue(provider.responds)
  }
}

@available(iOS 10.0, *)
extension UNUserNotificationCenter {
  private static let currentUserNotificationCenter = UNUserNotificationCenter.perform(NSSelectorFromString("alloc"))?.takeUnretainedValue() as! UNUserNotificationCenter

  @objc static func swizzled_currentNotificationCenter() -> UNUserNotificationCenter {
    return self.currentUserNotificationCenter
  }
}
