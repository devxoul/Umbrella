import XCTest
import Umbrella
import UmbrellaPosthog
import PostHog

final class PosthogProviderTests: XCTestCase {
  override func setUp() {
    super.setUp()
    let configuration = PHGPostHogConfiguration(apiKey: "YOUR_WRITE_KEY")
    PHGPostHog.setup(with: configuration)
  }

  func testPosthogProvider() {
    let provider = PosthogProvider()
    XCTAssertTrue(provider.cls === PHGPostHog.self)
    XCTAssertNotNil(provider.instance)
    XCTAssertTrue(provider.instance === PHGPostHog.shared())
    XCTAssertEqual(provider.selector, #selector(PHGPostHog.capture(_:properties:)))
    XCTAssertTrue(provider.responds)
  }
}
