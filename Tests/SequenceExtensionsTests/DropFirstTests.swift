#if DEBUG
  import XCTest
  @testable import SequenceExtensions

  class DropFirstTests: XCTestCase {
    func validate (_ results: [Int], against validResults: [Int]) {
      for index in results.indices {
        XCTAssertTrue(results[index] == validResults[index])
      }

      XCTAssertEqual(results.count, validResults.count)
    }

    func testShouldReturnValidResults () {
      self.validate(Array([1, 2, 3].lazy.drop(first: 0)), against: [1, 2, 3])
      self.validate(Array([1, 2, 3].lazy.drop(first: 1)), against: [2, 3])
      self.validate(Array([1, 2, 3].lazy.drop(first: 2)), against: [3])
      self.validate(Array([1, 2, 3].lazy.drop(first: 3)), against: [Int]())
      self.validate(Array([1, 2, 3].lazy.drop(first: 4)), against: [Int]())
    }

    func testResultsShouldBeLazyEvaluated () {
      iterationCount = 0

      _ = [1, 2, 3].lazy.drop(first: 3)

      XCTAssertEqual(iterationCount, 0)
    }
  }
#endif
