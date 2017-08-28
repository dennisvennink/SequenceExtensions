#if DEBUG
  import XCTest
  @testable import SequenceExtensions

  class Product4Tests: XCTestCase {
    func validate (_ results: [(Int, Int, Int, Int)], against validResults: [(Int, Int, Int, Int)]) {
      for index in results.indices {
        XCTAssertTrue(results[index] == validResults[index])
      }

      XCTAssertEqual(results.count, validResults.count)
    }

    func testShouldReturnValidResults () {
      self.validate(Array(product([1, 2], [3, 4], [5, 6], [])), against: [(Int, Int, Int, Int)]())

      self.validate(Array(product([1, 2], [3, 4], [5, 6], [7, 8])), against: [(1, 3, 5, 7), (1, 3, 5, 8), (1, 3, 6, 7),
        (1, 3, 6, 8), (1, 4, 5, 7), (1, 4, 5, 8), (1, 4, 6, 7), (1, 4, 6, 8), (2, 3, 5, 7), (2, 3, 5, 8), (2, 3, 6, 7),
        (2, 3, 6, 8), (2, 4, 5, 7), (2, 4, 5, 8), (2, 4, 6, 7), (2, 4, 6, 8)])
    }

    func testResultsShouldBeLazyEvaluated () {
      iterationCount = 0

      _ = product([1, 2], [3, 4], [5, 6], [7, 8])

      XCTAssertEqual(iterationCount, 0)
    }
  }
#endif
