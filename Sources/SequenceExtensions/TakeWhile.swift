public struct LazyTakeWhileIterator <T: IteratorProtocol>: IteratorProtocol {
  public typealias Element = T.Element

  private var iterator: T
  private var predicate: (Element) -> Bool
  private var reachedEnd = false

  internal init (_ iterator: T, _ predicate: @escaping (Element) -> Bool) {
    self.iterator = iterator
    self.predicate = predicate
  }

  public mutating func next () -> Element? {
    #if DEBUG
      iterationCount += 1
    #endif

    if self.reachedEnd {
      return nil
    }

    guard let next = self.iterator.next() else {
      self.reachedEnd = true

      return nil
    }

    if !self.predicate(next) {
      self.reachedEnd = true

      return nil
    }

    return next
  }
}

public struct LazyTakeWhileSequence <T: LazySequenceProtocol>: LazySequenceProtocol {
  public typealias Iterator = LazyTakeWhileIterator<T.Iterator>

  private let iterator: Iterator

  internal init (_ base: T, _ predicate: @escaping (Element) -> Bool) {
    self.iterator = Iterator(base.makeIterator(), predicate)
  }

  public func makeIterator () -> Iterator {
    return self.iterator
  }
}

public extension LazySequenceProtocol {
  /// Creates a lazily evaluated `Sequence` containing the initial, consecutive elements that satisfy the given
  /// predicate. Identical to `prefix(while:)`.
  ///
  ///     print(Array([1, 2, 3, 4, 5].lazy.take(while: {$0 <= 3})))
  ///     // [1, 2, 3]
  ///
  /// - Parameters:
  ///     - predicate: A closure that takes an element of the sequence as its argument and returns a Boolean value
  ///                  indicating whether the element should be included in the result.
  /// - Returns: A lazily evaluated `Sequence` that contains the consecutive elements that satisfy the predicate.
  func take (while predicate: @escaping (Element) -> Bool) -> LazyTakeWhileSequence<Self> {
    return LazyTakeWhileSequence(self, predicate)
  }
}
