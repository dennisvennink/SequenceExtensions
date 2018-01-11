import XCTest
@testable import SequenceExtensions

class ZipTests: XCTestCase {
  func testShouldReturnCorrectValue () {
    XCTAssertTrue(Array(zip([], [], [])) == [(Int, Int, Int)]())
    XCTAssertTrue(Array(zip([1, 2], [3, 4], [])) == [(Int, Int, Int)]())
    XCTAssertTrue(Array(zip([], [1, 2], [3, 4])) == [(Int, Int, Int)]())
    XCTAssertTrue(Array(zip([1, 2], [3, 4], [5, 6])) == [(1, 3, 5), (2, 4, 6)])

    XCTAssertTrue(Array(zip([], [], [], [])) == [(Int, Int, Int, Int)]())
    XCTAssertTrue(Array(zip([1, 2], [3, 4], [5, 6], [])) == [(Int, Int, Int, Int)]())
    XCTAssertTrue(Array(zip([], [1, 2], [3, 4], [5, 6])) == [(Int, Int, Int, Int)]())
    XCTAssertTrue(Array(zip([1, 2], [3, 4], [5, 6], [7, 8])) == [(1, 3, 5, 7), (2, 4, 6, 8)])

    XCTAssertTrue(Array(zip([], [], [], [], [])) == [(Int, Int, Int, Int, Int)]())
    XCTAssertTrue(Array(zip([1, 2], [3, 4], [5, 6], [7, 8], [])) == [(Int, Int, Int, Int, Int)]())
    XCTAssertTrue(Array(zip([], [1, 2], [3, 4], [5, 6], [7, 8])) == [(Int, Int, Int, Int, Int)]())
    XCTAssertTrue(Array(zip([1, 2], [3, 4], [5, 6], [7, 8], [9, 10])) == [(1, 3, 5, 7, 9), (2, 4, 6, 8, 10)])

    XCTAssertTrue(Array(zip([], [], [], [], [], [])) == [(Int, Int, Int, Int, Int, Int)]())
    XCTAssertTrue(Array(zip([1, 2], [3, 4], [5, 6], [7, 8], [9, 10], [])) == [(Int, Int, Int, Int, Int, Int)]())
    XCTAssertTrue(Array(zip([], [1, 2], [3, 4], [5, 6], [7, 8], [9, 10])) == [(Int, Int, Int, Int, Int, Int)]())
    XCTAssertTrue(Array(zip([1, 2], [3, 4], [5, 6], [7, 8], [9, 10], [11, 12])) == [(1, 3, 5, 7, 9, 11), (2, 4, 6, 8,
      10, 12)])
  }
}
