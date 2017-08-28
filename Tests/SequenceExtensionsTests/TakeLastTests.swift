#if DEBUG
  import XCTest
  @testable import SequenceExtensions

  class TakeLastTests: XCTestCase {
    func validate (_ results: [Int], against validResults: [Int]) {
      for index in results.indices {
        XCTAssertTrue(results[index] == validResults[index])
      }

      XCTAssertEqual(results.count, validResults.count)
    }

    func testShouldReturnValidResults () {
      self.validate(Array([1, 2, 3].take(last: 0)), against: [Int]())
      self.validate(Array([1, 2, 3].take(last: 1)), against: [3])
      self.validate(Array([1, 2, 3].take(last: 2)), against: [2, 3])
      self.validate(Array([1, 2, 3].take(last: 3)), against: [1, 2, 3])
      self.validate(Array([1, 2, 3].take(last: 4)), against: [1, 2, 3])
    }

    func testResultsShouldBeLazyEvaluated () {
      iterationCount = 0

      _ = [1, 2, 3].take(last: 3)

      XCTAssertEqual(iterationCount, 0)
    }
  }
#endif
