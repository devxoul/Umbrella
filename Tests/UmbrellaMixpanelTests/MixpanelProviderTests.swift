import XCTest
import Umbrella
import UmbrellaMixpanel
import Mixpanel

final class MixpanelProviderTests: XCTestCase {
  override func setUp() {
    super.setUp()
    Mixpanel.sharedInstance(withToken: "TEST_TOKEN", launchOptions: [:], trackCrashes: true, automaticPushTracking: false)
  }

  func testMixpanelProvider() {
    let provider = MixpanelProvider()
    XCTAssertTrue(provider.cls === Mixpanel.self)
    XCTAssertNotNil(provider.instance)
    XCTAssertTrue(provider.instance === Mixpanel.sharedInstance())
    XCTAssertEqual(provider.selector, #selector(Mixpanel.track(_:properties:)))
    XCTAssertTrue(provider.responds)
  }
}
