import XCTest
import Umbrella
import UmbrellaAnswers
import Answers

final class AnswersProviderTests: XCTestCase {
  func testAnswersProvider() {
    let provider = AnswersProvider()
    XCTAssertTrue(provider.cls === Answers.self)
    XCTAssertNil(provider.instance)
    XCTAssertEqual(provider.selector, #selector(Answers.logCustomEvent(withName:customAttributes:)))
    XCTAssertTrue(provider.responds)
  }
}
