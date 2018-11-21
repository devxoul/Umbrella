import XCTest
import Umbrella
import UmbrellaFacebook
import FBSDKCoreKit

final class FacebookProviderTests: XCTestCase {
  func testFacebookProvider() {
    let provider = FacebookProvider()
    XCTAssertTrue(provider.cls === FBSDKAppEvents.self)
    XCTAssertNil(provider.instance)
    XCTAssertEqual(provider.selector, #selector(FBSDKAppEvents.logEvent(_:parameters:)))
    XCTAssertTrue(provider.responds)
  }
}
