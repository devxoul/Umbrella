import XCTest
import Umbrella
import UmbrellaACPCore
import ACPCore

final class ACPCoreProviderTests: XCTestCase {
  func testLocalyticsProvider() {
    let provider = ACPCoreProvider()
    XCTAssertTrue(provider.cls === ACPCore.self)
    XCTAssertNil(provider.instance)
    XCTAssertEqual(provider.selector, #selector(ACPCore.trackAction(_:data:)))
    XCTAssertTrue(provider.responds)
  }
}
