#if DEBUG
  import XCTest
  @testable import SequenceExtensions

  class Product2Tests: XCTestCase {
    func validate (_ results: [(Int, Int)], against validResults: [(Int, Int)]) {
      for index in results.indices {
        XCTAssertTrue(results[index] == validResults[index])
      }

      XCTAssertEqual(results.count, validResults.count)
    }

    func testShouldReturnValidResults () {
      self.validate(Array(product([1, 2], [])), against: [(Int, Int)]())
      self.validate(Array(product([1, 2], [3, 4])), against: [(1, 3), (1, 4), (2, 3), (2, 4)])
    }

    func testResultsShouldBeLazyEvaluated () {
      iterationCount = 0

      _ = product([1, 2], [3, 4])

      XCTAssertEqual(iterationCount, 0)
    }
  }
#endif
