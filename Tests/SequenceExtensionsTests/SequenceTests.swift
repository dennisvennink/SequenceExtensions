import XCTest
@testable import SequenceExtensions

class SequenceTests: XCTestCase {
  func testDuplicatesOfShouldReturnCorrectValue () {
    XCTAssertTrue([Int]().duplicates.isEmpty)

    let duplicates = [0, 1, 1, 2, 2, 2, 3, 3, 3, 3].duplicates

    XCTAssertNil(duplicates[0])
    XCTAssertEqual(duplicates[1]!, [2])
    XCTAssertEqual(duplicates[2]!, [4, 5])
    XCTAssertEqual(duplicates[3]!, [7, 8, 9])
  }

  func testOccurrencesShouldReturnCorrectValue () {
    XCTAssertTrue([Int]().occurrences.isEmpty)

    let occurrences = [0, 1, 1, 2, 2, 2, 3, 3, 3, 3].occurrences

    XCTAssertEqual(occurrences[0]!, [0])
    XCTAssertEqual(occurrences[1]!, [1, 2])
    XCTAssertEqual(occurrences[2]!, [3, 4, 5])
    XCTAssertEqual(occurrences[3]!, [6, 7, 8, 9])
  }

  func testOccurrencesOfShouldReturnCorrectValue () {
    XCTAssertTrue([Int]().occurrences(of: [Int]()).isEmpty)
    XCTAssertTrue([Int]().occurrences(of: [0]).isEmpty)

    let occurrences = [0, 1, 1, 2, 2, 2, 3, 3, 3, 3].occurrences(of: [1, 3])

    XCTAssertNil(occurrences[0])
    XCTAssertEqual(occurrences[1]!, [1, 2])
    XCTAssertNil(occurrences[2])
    XCTAssertEqual(occurrences[3]!, [6, 7, 8, 9])
  }
}
