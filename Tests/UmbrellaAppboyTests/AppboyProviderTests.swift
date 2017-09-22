import XCTest
import Umbrella
import UmbrellaAppboy
import Appboy_iOS_SDK

final class AppboyProviderTests: XCTestCase {
  private enum Swizzle {
    static let UNUserNotificationCenterInitializer: Void = {
      guard let oldMethod = class_getInstanceMethod(
        UNUserNotificationCenter.self,
        NSSelectorFromString("initWithBundleIdentifier:")
      ) else { return }
      guard let newMethod = class_getInstanceMethod(
        UNUserNotificationCenter.self,
        #selector(UNUserNotificationCenter.swizzled_init(bundleIdentifier:))
      ) else { return }
      method_exchangeImplementations(oldMethod, newMethod)
    }()
  }

  override func setUp() {
    super.setUp()
    Swizzle.UNUserNotificationCenterInitializer
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

extension UNUserNotificationCenter {
  @objc func swizzled_init(bundleIdentifier: String?) -> UNUserNotificationCenter {
    return self.swizzled_init(bundleIdentifier: "com.umbrella.test")
  }
}
