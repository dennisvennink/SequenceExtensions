#if DEBUG
  import XCTest
  @testable import SequenceExtensions

  class Convolution2Tests: XCTestCase {
    func validate (_ results: [(Int, Int)], against validResults: [(Int, Int)]) {
      for index in results.indices {
        XCTAssertTrue(results[index] == validResults[index])
      }

      XCTAssertEqual(results.count, validResults.count)
    }

    func testShouldReturnValidResults () {
      self.validate(Array(convolution([1, 2], [Int]())), against: [(Int, Int)]())
      self.validate(Array(convolution([1, 2], [3, 4, 5])), against: [(1, 3), (2, 4)])
      self.validate(Array(convolution([1, 2], [3, 4])), against: [(1, 3), (2, 4)])
    }

    func testResultsShouldBeLazyEvaluated () {
      iterationCount = 0

      _ = convolution([1, 2], [3, 4])

      XCTAssertEqual(iterationCount, 0)
    }
  }
#endif
