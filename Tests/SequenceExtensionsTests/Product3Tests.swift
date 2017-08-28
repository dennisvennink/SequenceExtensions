#if DEBUG
  import XCTest
  @testable import SequenceExtensions

  class Product3Tests: XCTestCase {
    func validate (_ results: [(Int, Int, Int)], against validResults: [(Int, Int, Int)]) {
      for index in results.indices {
        XCTAssertTrue(results[index] == validResults[index])
      }

      XCTAssertEqual(results.count, validResults.count)
    }

    func testShouldReturnValidResults () {
      self.validate(Array(product([1, 2], [3, 4], [])), against: [(Int, Int, Int)]())

      self.validate(Array(product([1, 2], [3, 4], [5, 6])), against: [(1, 3, 5), (1, 3, 6), (1, 4, 5), (1, 4, 6),
        (2, 3, 5), (2, 3, 6), (2, 4, 5), (2, 4, 6)])
    }

    func testResultsShouldBeLazyEvaluated () {
      iterationCount = 0

      _ = product([1, 2], [3, 4], [5, 6])

      XCTAssertEqual(iterationCount, 0)
    }
  }
#endif
