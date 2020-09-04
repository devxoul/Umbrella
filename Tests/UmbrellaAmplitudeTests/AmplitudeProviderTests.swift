import XCTest
import Umbrella
import UmbrellaAmplitude
import Amplitude_iOS

final class AmplitudeProviderTests: XCTestCase {
  func testAmplitudeProvider() {
    let provider = AmplitudeProvider()
    XCTAssertTrue(provider.cls === Amplitude.self)
    XCTAssertNotNil(provider.instance)
    XCTAssertEqual(provider.selector, #selector(Amplitude.logEvent(_:withEventProperties:)))
    XCTAssertTrue(provider.responds)
  }
}
