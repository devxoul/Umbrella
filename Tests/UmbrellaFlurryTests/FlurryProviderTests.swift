import XCTest
import Umbrella
import UmbrellaFlurry
import Flurry_iOS_SDK

final class FlurryProviderTests: XCTestCase {
  func testFlurryProvider() {
    let provider = FlurryProvider()
    XCTAssertTrue(provider.cls === Flurry.self)
    XCTAssertNil(provider.instance)
    XCTAssertEqual(provider.selector, #selector(Flurry.logEvent(_:withParameters:)))
    XCTAssertTrue(provider.responds)
  }
}
