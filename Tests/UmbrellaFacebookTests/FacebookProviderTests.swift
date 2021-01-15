import XCTest
import Umbrella
import UmbrellaFacebook
import FBSDKCoreKit

final class FacebookProviderTests: XCTestCase {
  func testFacebookProvider() {
    let provider = FacebookProvider()
    XCTAssertTrue(provider.cls === AppEvents.self)
    XCTAssertNil(provider.instance)
    XCTAssertEqual(provider.selector, #selector(AppEvents.logEvent(_:parameters:)))
    XCTAssertTrue(provider.responds)
  }
}
