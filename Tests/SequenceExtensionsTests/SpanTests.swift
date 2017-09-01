#if DEBUG
  import XCTest
  @testable import SequenceExtensions

  class SpanTests: XCTestCase {
    func validate (_ results: [Int], against validResults: [Int]) {
      for index in results.indices {
        XCTAssertTrue(results[index] == validResults[index])
      }

      XCTAssertEqual(results.count, validResults.count)
    }

    func testShouldReturnValidResults () {
      var (satisfiedElements, remainingElements) = [1, 2, 3, 4, 1, 2, 3, 4].lazy.span{$0 < 3}

      self.validate(Array(satisfiedElements), against: [1, 2])
      self.validate(Array(remainingElements), against: [3, 4, 1, 2, 3, 4])

      (satisfiedElements, remainingElements) = [1, 2, 3].lazy.span{$0 < 9}

      self.validate(Array(satisfiedElements), against: [1, 2, 3])
      self.validate(Array(remainingElements), against: [Int]())

      (satisfiedElements, remainingElements) = [1, 2, 3].lazy.span{$0 < 0}

      self.validate(Array(satisfiedElements), against: [Int]())
      self.validate(Array(remainingElements), against: [1, 2, 3])
    }

    func testResultsShouldBeLazyEvaluated () {
      iterationCount = 0

      _ = [1, 2, 3].lazy.span{$0 < 9}

      XCTAssertEqual(iterationCount, 0)
    }
  }
#endif
