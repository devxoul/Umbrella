//
//  UmbrellaIntercomTests.swift
//  UmbrellaIntercomTests
//
//  Created by Sygnoos9 on 11/17/18.
//

import XCTest
import Umbrella
@testable import UmbrellaIntercom
import Intercom

class UmbrellaIntercomTests: XCTestCase {
  override func setUp() {
    super.setUp()
    Intercom.setApiKey("TEST_TOKEN", forAppId: "TEST_APP_ID")
  }

  func testMixpanelProvider() {
    let provider = IntercomProvider()
    XCTAssertTrue(provider.cls === Intercom.self)
    XCTAssertNil(provider.instance)
    XCTAssertEqual(provider.selector, #selector(Intercom.logEvent(withName:metaData:)))
    XCTAssertTrue(provider.responds)
  }
}
