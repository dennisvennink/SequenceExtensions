#if DEBUG
  import XCTest
  @testable import SequenceExtensions

  class Product5Tests: XCTestCase {
    func validate (_ results: [(Int, Int, Int, Int, Int)], against validResults: [(Int, Int, Int, Int, Int)]) {
      for index in results.indices {
        XCTAssertTrue(results[index] == validResults[index])
      }

      XCTAssertEqual(results.count, validResults.count)
    }

    func testShouldReturnValidResults () {
      self.validate(Array(product([1, 2], [3, 4], [5, 6], [7, 8], [])), against: [(Int, Int, Int, Int, Int)]())

      self.validate(Array(product([1, 2], [3, 4], [5, 6], [7, 8], [9, 10])), against: [(1, 3, 5, 7, 9),
        (1, 3, 5, 7, 10), (1, 3, 5, 8, 9), (1, 3, 5, 8, 10), (1, 3, 6, 7, 9), (1, 3, 6, 7, 10), (1, 3, 6, 8, 9),
        (1, 3, 6, 8, 10), (1, 4, 5, 7, 9), (1, 4, 5, 7, 10), (1, 4, 5, 8, 9), (1, 4, 5, 8, 10), (1, 4, 6, 7, 9),
        (1, 4, 6, 7, 10), (1, 4, 6, 8, 9), (1, 4, 6, 8, 10), (2, 3, 5, 7, 9), (2, 3, 5, 7, 10), (2, 3, 5, 8, 9),
        (2, 3, 5, 8, 10), (2, 3, 6, 7, 9), (2, 3, 6, 7, 10), (2, 3, 6, 8, 9), (2, 3, 6, 8, 10), (2, 4, 5, 7, 9),
        (2, 4, 5, 7, 10), (2, 4, 5, 8, 9), (2, 4, 5, 8, 10), (2, 4, 6, 7, 9), (2, 4, 6, 7, 10), (2, 4, 6, 8, 9),
        (2, 4, 6, 8, 10)])
    }

    func testResultsShouldBeLazyEvaluated () {
      iterationCount = 0

      _ = product([1, 2], [3, 4], [5, 6], [7, 8], [9, 10])

      XCTAssertEqual(iterationCount, 0)
    }
  }
#endif
