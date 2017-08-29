public struct LazyTakeFirstIterator <T: IteratorProtocol>: IteratorProtocol {
  public typealias Element = T.Element

  private var iterator: T
  private var numberOfElements: Int
  private var reachedEnd = false

  internal init (_ iterator: T, _ numberOfElements: Int) {
    precondition(numberOfElements >= 0, "the number of elements to take first must be 0 or higher")

    self.iterator = iterator
    self.numberOfElements = numberOfElements
  }

  public mutating func next () -> Element? {
    #if DEBUG
      iterationCount += 1
    #endif

    if self.reachedEnd {
      return nil
    }

    if self.numberOfElements == 0 {
      self.reachedEnd = true

      return nil
    }

    let next = self.iterator.next()

    self.numberOfElements -= 1

    return next
  }
}

public struct LazyTakeFirstSequence <T: Sequence>: LazySequenceProtocol {
  public typealias Iterator = LazyTakeFirstIterator<T.Iterator>

  private let iterator: Iterator

  internal init (_ base: T, _ numberOfElements: Int) {
    self.iterator = Iterator(base.makeIterator(), numberOfElements)
  }

  public func makeIterator () -> Iterator {
    return self.iterator
  }
}

public extension Sequence {
  /// Creates a lazily evaluated `Sequence` containing the first number of elements of `self`. Is similar to
  /// `prefix(_ maxLength:)`, but `take(first:)` will guarantee to return a lazy `Sequence` when operating on a lazy
  /// `Sequence`.
  ///
  ///     _ = [1, 2, 3, 4, 5].take(first: 3)
  ///     // [1, 2, 3]
  ///
  /// - Parameters:
  ///     - numberOfElements: Specifies the number of elements to take from the start of `self`.
  ///
  /// - Returns: A lazily evaluated `Sequence` that takes the number of elements from the start of `self`.
  func take (first numberOfElements: Int) -> LazyTakeFirstSequence<Self> {
    return LazyTakeFirstSequence(self, numberOfElements)
  }
}
