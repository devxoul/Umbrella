import XCTest
import Umbrella
import UmbrellaAppCenter
import AppCenterAnalytics

final class AppCenterProviderTests: XCTestCase {
  func testAppCenterProvider() {
    let provider = AppCenterProvider()
    XCTAssertTrue(provider.cls === AppCenterAnalytics.Analytics.self)
    XCTAssertNil(provider.instance)
    XCTAssertEqual(provider.selector, #selector(AppCenterAnalytics.Analytics.trackEvent(_:withProperties:) as (String, [String: String]) -> ()))
    XCTAssertTrue(provider.responds)
  }
}
