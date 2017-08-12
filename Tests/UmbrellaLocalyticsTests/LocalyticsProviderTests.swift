import XCTest
import Umbrella
import UmbrellaLocalytics
import Localytics

final class LocalyticsProviderTests: XCTestCase {
  func testLocalyticsProvider() {
    let provider = LocalyticsProvider()
    XCTAssertTrue(provider.cls === Localytics.self)
    XCTAssertNil(provider.instance)
    XCTAssertEqual(provider.selector, #selector(Localytics.tagEvent(_:attributes:)))
    XCTAssertTrue(provider.responds)
  }
}
