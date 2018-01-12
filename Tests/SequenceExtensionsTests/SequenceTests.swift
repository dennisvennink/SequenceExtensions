import XCTest
@testable import SequenceExtensions

class SequenceTests: XCTestCase {
  func testShouldReturnCorrectValue () {
    XCTAssertEqual([Int]().occurrences, [Int: Int]())
    XCTAssertEqual([0, 1, 1, 2, 2, 2].occurrences, [0: 1, 1: 2, 2: 3])

    XCTAssertEqual([Int]().uniques, [Int]())
    XCTAssertEqual([0, 1, 1, 2, 2, 2].uniques, [0, 1, 2])

    XCTAssertEqual([Int]().duplicates, [Int]())
    XCTAssertEqual([0, 1, 1, 2, 2, 2].duplicates, [1, 2, 2])

    XCTAssertEqual([Int]().duplicates.uniques, [Int]())
    XCTAssertEqual([0, 1, 1, 2, 2, 2].duplicates.uniques, [1, 2])
  }
}
