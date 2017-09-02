public struct LazyAppendIterator <T: IteratorProtocol>: IteratorProtocol {
  public typealias Element = T.Element

  private var iterator1: T
  private var iterator2: T
  private var reachedEndOfIterator1 = false
  private var reachedEnd = false

  internal init (_ iterator1: T, _ iterator2: T) {
    self.iterator1 = iterator1
    self.iterator2 = iterator2
  }

  public mutating func next () -> Element? {
    #if DEBUG
      iterationCount += 1
    #endif

    if self.reachedEnd {
      return nil
    }

    var next: Element?

    if !self.reachedEndOfIterator1 {
      next = self.iterator1.next()

      if next == nil {
        self.reachedEndOfIterator1 = true
      }
    }

    if next == nil {
      next = self.iterator2.next()

      if next == nil {
        self.reachedEnd = true
      }
    }

    return next
  }
}

public struct LazyAppendSequence <T: Sequence>: LazySequenceProtocol {
  public typealias Iterator = LazyAppendIterator<T.Iterator>

  private let sequence1: T
  private let sequence2: T

  internal init (_ sequence1: T, _ sequence2: T) {
    self.sequence1 = sequence1
    self.sequence2 = sequence2
  }

  public func makeIterator () -> Iterator {
    return Iterator(self.sequence1.makeIterator(), self.sequence2.makeIterator())
  }
}

infix operator ++

/// Creates a lazily evaluated `Sequence` that appends the right-hand `Sequence` to the left-hand `Sequence`. Unlike
/// `+(_:_:)`, `++(_:_:)` will guarantee to return a lazy `Sequence` when operating on a lazy `Sequence`.
///
///     print(Array([1, 2] ++ [3, 4]))
///     // [1, 2, 3, 4]
///
/// - Attention:
///     - If the left-hand `Sequence` is not finite, the result is the left-hand `Sequence`.
///     - Returns a lazy `Sequence`.
/// - Parameters:
///     - lhs: The left-hand `Sequence`.
///     - rhs: The right-hand `Sequence`.
/// - Returns: A lazily evaluated `Sequence` containing the elements from the right-hand `Sequence` appended to the
///            left-hand `Sequence`.
public func ++ <T: Sequence> (lhs: T, rhs: T) -> LazyAppendSequence<T> {
  return LazyAppendSequence(lhs, rhs)
}
