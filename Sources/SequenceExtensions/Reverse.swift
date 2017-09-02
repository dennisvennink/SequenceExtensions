public struct LazyReverseIterator <T: IteratorProtocol>: IteratorProtocol {
  public typealias Element = T.Element

  private var iterator: T
  private var memo = [Element?]()
  private var didInitialise = false
  private var reachedEnd = false
  private var index: Int?

  internal init (_ iterator: T) {
    self.iterator = iterator
  }

  public mutating func next () -> Element? {
    #if DEBUG
      iterationCount += 1
    #endif

    if self.reachedEnd {
      return nil
    }

    if !self.didInitialise {
      var next: Element?

      while true {
        next = self.iterator.next()

        if next != nil {
          self.memo.append(next)
        } else {
          break
        }
      }

      self.index = self.memo.count

      self.didInitialise = true
    }

    if self.index! > 0 {
      self.index! -= 1
    } else {
      self.reachedEnd = true

      return nil
    }

    return self.memo[self.index!]
  }
}

public struct LazyReverseSequence <T: LazySequenceProtocol>: LazySequenceProtocol {
  public typealias Iterator = LazyReverseIterator<T.Iterator>

  private let iterator: Iterator

  internal init (_ base: T) {
    self.iterator = Iterator(base.makeIterator())
  }

  public func makeIterator () -> Iterator {
    return self.iterator
  }
}

public extension LazySequenceProtocol {
  /// Creates a lazily evaluated `Sequence` in which the elements of `self` are in reverse order.
  ///
  ///     print(Array([1, 2, 3].lazy.reverse))
  ///     // [3, 2, 1]
  ///
  /// - Attention: `Self` must be finite.
  /// - Complexity: The first operation is O(n + 1). Consecutive operations are O(1).
  var reverse: LazyReverseSequence<Self> {
    return LazyReverseSequence(self)
  }
}
