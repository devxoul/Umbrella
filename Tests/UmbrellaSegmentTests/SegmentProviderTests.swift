import XCTest
import Umbrella
import UmbrellaSegment
import Analytics

final class SegmentProviderTests: XCTestCase {
  override func setUp() {
    super.setUp()
    let configuration = AnalyticsConfiguration(writeKey: "YOUR_WRITE_KEY")
    Analytics.setup(with: configuration)
  }

  func testSegmentProvider() {
    let provider = SegmentProvider()
    XCTAssertTrue(provider.cls === Analytics.self)
    XCTAssertNotNil(provider.instance)
    XCTAssertTrue(provider.instance === Analytics.shared())
    XCTAssertEqual(provider.selector, #selector(Analytics.track(_:properties:)))
    XCTAssertTrue(provider.responds)
  }
}
