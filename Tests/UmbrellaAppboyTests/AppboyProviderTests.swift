import XCTest
import Umbrella
import UmbrellaAppboy
import Appboy_iOS_SDK

final class AppboyProviderTests: XCTestCase {
  private enum Swizzle {
    static func swizzle(_ cls: AnyClass, _ oldSelectorName: String, _ newSelector: Selector) {
      guard let oldMethod = class_getInstanceMethod(cls, NSSelectorFromString(oldSelectorName)) else { return }
      guard let newMethod = class_getInstanceMethod(cls, newSelector) else { return }
      method_exchangeImplementations(oldMethod, newMethod)
    }

    static let UNUserNotificationCenterInitializer: Void = {
      guard #available(iOS 10.0, *) else { return }
      let cls = UNUserNotificationCenter.self
      let oldSelector = NSSelectorFromString("initWithBundleProxy:")
      let newSelector = #selector(UNUserNotificationCenter.swizzled_init(bundleProxy:))
      guard let oldMethod = class_getInstanceMethod(cls, oldSelector) else { return }
      guard let newMethod = class_getInstanceMethod(cls, newSelector) else { return }
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

@available(iOS 10.0, *)
extension UNUserNotificationCenter {
  @objc func swizzled_init(bundleProxy: Any?) -> UNUserNotificationCenter {
    return self.swizzled_init(bundleProxy: TestBundle())
  }
}

class TestBundle: Bundle {
  @objc var un_applicationBundleIdentifier: String? {
    return "com.umbrella.test"
  }
}
