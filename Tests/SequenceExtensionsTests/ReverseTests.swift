#if DEBUG
  import XCTest
  @testable import SequenceExtensions

  class ReverseTests: XCTestCase {
    func validate (_ results: [Int], against validResults: [Int]) {
      for index in results.indices {
        XCTAssertTrue(results[index] == validResults[index])
      }

      XCTAssertEqual(results.count, validResults.count)
    }

    func testShouldReturnValidResults () {
      self.validate(Array([1, 2, 3].lazy.reverse), against: [3, 2, 1])
    }

    func testResultsShouldBeLazyEvaluated () {
      iterationCount = 0

      _ = [1, 2, 3].lazy.reverse

      XCTAssertEqual(iterationCount, 0)
    }
  }
#endif

