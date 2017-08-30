public struct LazyConvolution2Iterator <T1: IteratorProtocol, T2: IteratorProtocol>: IteratorProtocol {
  public typealias Element = (T1.Element, T2.Element)

  private var iterator1: T1
  private var iterator2: T2
  private var reachedEnd = false

  internal init (_ iterator1: T1, _ iterator2: T2) {
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

    guard let element1 = self.iterator1.next(), let element2 = self.iterator2.next() else {
      self.reachedEnd = true

      return nil
    }

    return (element1, element2)
  }
}

public struct LazyConvolution2Sequence <T1: Sequence, T2: Sequence>: LazySequenceProtocol {
  public typealias Iterator = LazyConvolution2Iterator<T1.Iterator, T2.Iterator>

  private let sequence1: T1
  private let sequence2: T2

  internal init (_ sequence1: T1, _ sequence2: T2) {
    self.sequence1 = sequence1
    self.sequence2 = sequence2
  }

  public func makeIterator () -> Iterator {
    return Iterator(self.sequence1.makeIterator(), self.sequence2.makeIterator())
  }
}

/// Creates a [convolution][1] from two `Sequence`s using lazy evaluation. Is similar to `zip(_:_:)`, but returns a
/// lazily evaluated `Sequence`.
///
///     print(Array(convolution([1, 2], [3, 4])))
///     // [(1, 3), (2, 4)]
///
/// [1]: https://en.wikipedia.org/wiki/Convolution_(computer_science)
///
/// - Attention:
///     - If the `Sequence`s are of different lengths, the resulting `Sequence` is the same length as the shortest
///       `Sequence`.
///     - Returns a lazy `Sequence`.
/// - Parameters:
///     - sequence1: The first `Sequence`.
///     - sequence2: The second `Sequence`.
/// - Returns: A convolution as a lazily evaluated `Sequence` of 2-tuples.
public func convolution <T1: Sequence, T2: Sequence> (_ sequence1: T1, _ sequence2: T2) -> LazyConvolution2Sequence<T1,
    T2> {
  return LazyConvolution2Sequence(sequence1, sequence2)
}
