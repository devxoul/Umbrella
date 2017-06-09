import XCTest
import Umbrella

class UmbrellaTests: XCTestCase {
  var analytics: Analytics<TestEvent>!
  var firebaseProvider: MockFirebaseProvider!
  var fabricProvider: MockFabricProvider!

  override func setUp() {
    super.setUp()
    self.analytics = Analytics()
    self.firebaseProvider = MockFirebaseProvider()
    self.fabricProvider = MockFabricProvider()
  }

  func testAnalytics_singleProvider() {
    self.analytics.register(provider: self.firebaseProvider)
    self.analytics.log(event: .login(username: "devxoul"))
    XCTAssertEqual(self.firebaseProvider.events.count, 1)
    XCTAssertEqual(self.firebaseProvider.events[0].name, "login")
    XCTAssertEqual(self.firebaseProvider.events[0].parameters!.count, 1)
    XCTAssertEqual(self.firebaseProvider.events[0].parameters!["username"] as! String, "devxoul")
  }

  func testAnalytics_singleProvider_nilName() {
    self.analytics.register(provider: self.fabricProvider)
    self.analytics.log(event: .purchase(productID: 123, price: 99.9))
    XCTAssertEqual(self.fabricProvider.events.count, 0)
  }

  func testAnalytics_multipleProvider() {
    self.analytics.register(provider: self.firebaseProvider)
    self.analytics.register(provider: self.fabricProvider)
    self.analytics.log(event: .login(username: "devxoul"))
    self.analytics.log(event: .purchase(productID: 123, price: 99.9))

    XCTAssertEqual(self.firebaseProvider.events.count, 2)
    XCTAssertEqual(self.firebaseProvider.events[0].name, "login")
    XCTAssertEqual(self.firebaseProvider.events[0].parameters!.count, 1)
    XCTAssertEqual(self.firebaseProvider.events[0].parameters!["username"] as! String, "devxoul")
    XCTAssertEqual(self.firebaseProvider.events[1].name, "purchase")
    XCTAssertEqual(self.firebaseProvider.events[1].parameters!.count, 2)
    XCTAssertEqual(self.firebaseProvider.events[1].parameters!["product_id"] as! Int, 123)
    XCTAssertEqual(self.firebaseProvider.events[1].parameters!["price"] as! Float, 99.9)

    XCTAssertEqual(self.fabricProvider.events.count, 1)
    XCTAssertEqual(self.fabricProvider.events[0].name, "Login")
    XCTAssertEqual(self.fabricProvider.events[0].parameters!.count, 1)
    XCTAssertEqual(self.fabricProvider.events[0].parameters!["Username"] as! String, "devxoul")
  }
}
