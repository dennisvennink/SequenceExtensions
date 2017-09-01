#if DEBUG
  import XCTest
  @testable import SequenceExtensions

  class IntersperseTests: XCTestCase {
    func validate (_ results: [Int], against validResults: [Int]) {
      for index in results.indices {
        XCTAssertTrue(results[index] == validResults[index])
      }

      XCTAssertEqual(results.count, validResults.count)
    }

    func testShouldReturnValidResults () {
      self.validate(Array([Int]().lazy.intersperse(2)), against: [Int]())
      self.validate(Array([1].lazy.intersperse(2)), against: [1])
      self.validate(Array([1, 1].lazy.intersperse(2)), against: [1, 2, 1])
      self.validate(Array([1, 1, 1].lazy.intersperse(2)), against: [1, 2, 1, 2, 1])
    }

    func testResultsShouldBeLazyEvaluated () {
      iterationCount = 0

      _ = [1, 1, 1].lazy.intersperse(2)

      XCTAssertEqual(iterationCount, 0)
    }
  }
#endif
