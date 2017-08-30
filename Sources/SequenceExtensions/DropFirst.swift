public struct LazyDropFirstIterator <T: IteratorProtocol>: IteratorProtocol {
  public typealias Element = T.Element

  private var iterator: T
  private var numberOfElements: Int
  private var didInitialiseIterator = false
  private var reachedEnd = false

  internal init (_ iterator: T, _ numberOfElements: Int) {
    precondition(numberOfElements >= 0, "the number of elements to drop first must be 0 or higher")

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

    if !self.didInitialiseIterator {
      while self.numberOfElements > 0 {
        _ = self.iterator.next()

        self.numberOfElements -= 1
      }

      self.didInitialiseIterator = true
    }

    let next = self.iterator.next()

    if next == nil {
      self.reachedEnd = true

      return nil
    }

    return next
  }
}

public struct LazyDropFirstSequence <T: LazySequenceProtocol>: LazySequenceProtocol {
  public typealias Iterator = LazyDropFirstIterator<T.Iterator>

  private let iterator: Iterator

  internal init (_ base: T, _ numberOfElements: Int) {
    self.iterator = Iterator(base.makeIterator(), numberOfElements)
  }

  public func makeIterator () -> Iterator {
    return self.iterator
  }
}

public extension LazySequenceProtocol {
  /// Creates a lazily evaluated `Sequence` containing all but the first number of elements of `self`.
  ///
  ///     print(Array([1, 2, 3, 4, 5].lazy.drop(first: 3)))
  ///     // [4, 5]
  ///
  /// - Attention: If the number of elements to drop exceeds the number of elements in `self`, the result is an empty
  ///              `Sequence`.
  /// - Precondition: `numberOfElements >= 0`
  /// - Parameters:
  ///     - numberOfElements: Specifies the first number of elements to drop from `self`.
  /// - Returns: A lazily evaluated `Sequence` containing all but the first number of elements of `self`.
  func drop (first numberOfElements: Int) -> LazyDropFirstSequence<Self> {
    return LazyDropFirstSequence(self, numberOfElements)
  }
}
