import XCTest
import Umbrella
import UmbrellaAppsFlyer
import AppsFlyerLib

final class AppsFlyerProviderTests: XCTestCase {
  func testAppsFlyerProvider() {
    let provider = AppsFlyerProvider()
    XCTAssertTrue(provider.cls === AppsFlyerTracker.self)
    XCTAssertNotNil(provider.instance)
    XCTAssertTrue(provider.instance === AppsFlyerTracker.shared())
    XCTAssertEqual(provider.selector, #selector(AppsFlyerTracker.trackEvent(_:withValues:)))
    XCTAssertTrue(provider.responds)
  }
}
