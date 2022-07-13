import XCTest

import BDContentTests
import BDPublishTests

var tests = [XCTestCaseEntry]()
tests += BDContentTests.__allTests()
tests += BDPublishTests.__allTests()

XCTMain(tests)
