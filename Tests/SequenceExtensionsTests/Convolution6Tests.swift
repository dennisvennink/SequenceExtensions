#if DEBUG
  import XCTest
  @testable import SequenceExtensions

  class Convolution6Tests: XCTestCase {
    func validate (_ results: [(Int, Int, Int, Int, Int, Int)], against validResults: [(Int, Int, Int, Int, Int, Int)])
        {
      for index in results.indices {
        XCTAssertTrue(results[index] == validResults[index])
      }

      XCTAssertEqual(results.count, validResults.count)
    }

    func testShouldReturnValidResults () {
      self.validate(Array(convolution([1, 2], [3, 4], [5, 6], [7, 8], [9, 10], [Int]())),
        against: [(Int, Int, Int, Int, Int, Int)]())

      self.validate(Array(convolution([1, 2], [3, 4], [5, 6], [7, 8], [9, 10], [11, 12, 13])),
        against: [(1, 3, 5, 7, 9, 11), (2, 4, 6, 8, 10, 12)])

      self.validate(Array(convolution([1, 2], [3, 4], [5, 6], [7, 8], [9, 10], [11, 12])),
        against: [(1, 3, 5, 7, 9, 11), (2, 4, 6, 8, 10, 12)])
    }

    func testResultsShouldBeLazyEvaluated () {
      iterationCount = 0

      _ = convolution([1, 2], [3, 4], [5, 6], [7, 8], [9, 10], [11, 12])

      XCTAssertEqual(iterationCount, 0)
    }
  }
#endif
