import XCTest
import Umbrella
import UmbrellaSegment
import Analytics

final class SegmentProviderTests: XCTestCase {
  override func setUp() {
    super.setUp()
    let configuration = SEGAnalyticsConfiguration(writeKey: "YOUR_WRITE_KEY")
    SEGAnalytics.setup(with: configuration)
  }

  func testSegmentProvider() {
    let provider = SegmentProvider()
    XCTAssertTrue(provider.cls === SEGAnalytics.self)
    XCTAssertNotNil(provider.instance)
    XCTAssertTrue(provider.instance === SEGAnalytics.shared())
    XCTAssertEqual(provider.selector, #selector(SEGAnalytics.track(_:properties:)))
    XCTAssertTrue(provider.responds)
  }
}
