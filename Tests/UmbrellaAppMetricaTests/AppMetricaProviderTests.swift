import XCTest
import Umbrella
import UmbrellaAppMetrica
import YandexMobileMetrica

final class AppMetricaProviderTests: XCTestCase {
  func testAppMetricaProvider() {
    let provider = AppMetricaProvider()
    XCTAssertTrue(provider.cls === YandexMobileMetrica.self)
    XCTAssertNil(provider.instance)
    XCTAssertEqual(provider.selector, #selector(YandexMobileMetrica.reportEvent(_:parameters:)))
    XCTAssertTrue(provider.responds)
  }
}
