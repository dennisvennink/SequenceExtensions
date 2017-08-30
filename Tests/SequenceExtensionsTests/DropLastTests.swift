#if DEBUG
  import XCTest
  @testable import SequenceExtensions

  class DropLastTests: XCTestCase {
    func validate (_ results: [Int], against validResults: [Int]) {
      for index in results.indices {
        XCTAssertTrue(results[index] == validResults[index])
      }

      XCTAssertEqual(results.count, validResults.count)
    }

    func testShouldReturnValidResults () {
      self.validate(Array([1, 2, 3].lazy.drop(last: 0)), against: [1, 2, 3])
      self.validate(Array([1, 2, 3].lazy.drop(last: 1)), against: [1, 2])
      self.validate(Array([1, 2, 3].lazy.drop(last: 2)), against: [1])
      self.validate(Array([1, 2, 3].lazy.drop(last: 3)), against: [Int]())
      self.validate(Array([1, 2, 3].lazy.drop(last: 4)), against: [Int]())
    }

    func testResultsShouldBeLazyEvaluated () {
      iterationCount = 0

      _ = [1, 2, 3].lazy.drop(last: 3)

      XCTAssertEqual(iterationCount, 0)
    }
  }
#endif
