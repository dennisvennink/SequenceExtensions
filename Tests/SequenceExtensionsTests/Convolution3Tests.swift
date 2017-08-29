#if DEBUG
  import XCTest
  @testable import SequenceExtensions

  class Convolution3Tests: XCTestCase {
    func validate (_ results: [(Int, Int, Int)], against validResults: [(Int, Int, Int)]) {
      for index in results.indices {
        XCTAssertTrue(results[index] == validResults[index])
      }

      XCTAssertEqual(results.count, validResults.count)
    }

    func testShouldReturnValidResults () {
      self.validate(Array(convolution([1, 2], [3, 4], [Int]())), against: [(Int, Int, Int)]())
      self.validate(Array(convolution([1, 2], [3, 4], [5, 6, 7])), against: [(1, 3, 5), (2, 4, 6)])
      self.validate(Array(convolution([1, 2], [3, 4], [5, 6])), against: [(1, 3, 5), (2, 4, 6)])
    }

    func testResultsShouldBeLazyEvaluated () {
      iterationCount = 0

      _ = convolution([1, 2], [3, 4], [5, 6])

      XCTAssertEqual(iterationCount, 0)
    }
  }
#endif
