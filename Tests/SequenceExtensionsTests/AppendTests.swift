#if DEBUG
  import XCTest
  @testable import SequenceExtensions

  class AppendTests: XCTestCase {
    func validate (_ results: [Int], against validResults: [Int]) {
      for index in results.indices {
        XCTAssertTrue(results[index] == validResults[index])
      }

      XCTAssertEqual(results.count, validResults.count)
    }

    func testShouldReturnValidResults () {
      self.validate(Array([1, 2, 3] ++ [Int]()), against: [1, 2, 3])
      self.validate(Array([Int]() ++ [1, 2, 3]), against: [1, 2, 3])
      self.validate(Array([1, 2, 3] ++ [4, 5, 6]), against: [1, 2, 3, 4, 5, 6])
    }

    func testResultsShouldBeLazyEvaluated () {
      iterationCount = 0

      _ = [1, 2, 3] ++ [4, 5, 6]

      XCTAssertEqual(iterationCount, 0)
    }
  }
#endif
