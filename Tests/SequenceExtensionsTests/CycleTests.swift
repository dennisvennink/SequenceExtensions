#if DEBUG
  import XCTest
  @testable import SequenceExtensions

  class CycleTests: XCTestCase {
    func validate (_ results: [Int], against validResults: [Int]) {
      for index in results.indices {
        XCTAssertTrue(results[index] == validResults[index])
      }

      XCTAssertEqual(results.count, validResults.count)
    }

    func testShouldReturnValidResults () {
      self.validate(Array([].cycle.take(first: 5)), against: [Int]())
      self.validate(Array([1, 2, 3].cycle.take(first: 5)), against: [1, 2, 3, 1, 2])
    }

    func testResultsShouldBeLazyEvaluated () {
      iterationCount = 0

      _ = [1, 2, 3].cycle.take(first: 5)

      XCTAssertEqual(iterationCount, 0)
    }
  }
#endif
