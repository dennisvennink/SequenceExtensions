#if DEBUG
  import XCTest
  @testable import SequenceExtensions

  class TakeWhileTests: XCTestCase {
    func validate (_ results: [Int], against validResults: [Int]) {
      for index in results.indices {
        XCTAssertTrue(results[index] == validResults[index])
      }

      XCTAssertEqual(results.count, validResults.count)
    }

    func testShouldReturnValidResults () {
      self.validate(Array([1, 2, 3].lazy.take(while: {$0 <= 0})), against: [Int]())
      self.validate(Array([1, 2, 3].lazy.take(while: {$0 <= 1})), against: [1])
      self.validate(Array([1, 2, 3].lazy.take(while: {$0 <= 2})), against: [1, 2])
      self.validate(Array([1, 2, 3].lazy.take(while: {$0 <= 3})), against: [1, 2, 3])
    }

    func testResultsShouldBeLazyEvaluated () {
      iterationCount = 0

      _ = [1, 2, 3].lazy.take(while: {$0 <= 3})

      XCTAssertEqual(iterationCount, 0)
    }
  }
#endif
