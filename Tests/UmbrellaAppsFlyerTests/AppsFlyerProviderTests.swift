import XCTest
import Umbrella
import UmbrellaAppsFlyer
import AppsFlyerLib

final class AppsFlyerProviderTests: XCTestCase {
  func testAppsFlyerProvider() {
    let provider = AppsFlyerProvider()
    XCTAssertTrue(provider.cls === AppsFlyerLib.self)
    XCTAssertNotNil(provider.instance)
    XCTAssertTrue(provider.instance === AppsFlyerLib.shared())
    XCTAssertEqual(provider.selector, #selector(AppsFlyerLib.logEvent(_:withValues:)))
    XCTAssertTrue(provider.responds)
  }
}
