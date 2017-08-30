public struct LazyCycleIterator <T: LazySequenceProtocol>: IteratorProtocol {
  public typealias Element = T.Element

  private var sequence: T
  private var iterator: T.Iterator

  internal init (_ sequence: T) {
    self.sequence = sequence
    self.iterator = self.sequence.makeIterator()
  }

  public mutating func next () -> Element? {
    #if DEBUG
      iterationCount += 1
    #endif

    var next = self.iterator.next()

    if next == nil {
      self.iterator = self.sequence.makeIterator()
      next = self.iterator.next()
    }

    return next
  }
}

public struct LazyCycleSequence <T: LazySequenceProtocol>: LazySequenceProtocol {
  public typealias Iterator = LazyCycleIterator<T>

  private let iterator: Iterator

  internal init (_ base: T) {
    self.iterator = Iterator(base)
  }

  public func makeIterator () -> Iterator {
    return self.iterator
  }
}

public extension LazySequenceProtocol {
  /// Creates a lazily evaluated `Sequence` that infinitely repeats the elements of `self`.
  ///
  ///     print(Array([1, 2, 3].lazy.cycle.take(10)))
  ///     // [1, 2, 3, 1, 2, 3, 1, 2, 3, 1]
  var cycle: LazyCycleSequence<Self> {
    return LazyCycleSequence(self)
  }
}
