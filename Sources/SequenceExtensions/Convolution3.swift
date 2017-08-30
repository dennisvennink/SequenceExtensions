public struct LazyConvolution3Iterator <T1: IteratorProtocol, T2: IteratorProtocol, T3: IteratorProtocol>:
    IteratorProtocol {
  public typealias Element = (T1.Element, T2.Element, T3.Element)

  private var iterator1: T1
  private var iterator2: T2
  private var iterator3: T3
  private var reachedEnd = false

  internal init (_ iterator1: T1, _ iterator2: T2, _ iterator3: T3) {
    self.iterator1 = iterator1
    self.iterator2 = iterator2
    self.iterator3 = iterator3
  }

  public mutating func next () -> Element? {
    #if DEBUG
      iterationCount += 1
    #endif

    if self.reachedEnd {
      return nil
    }

    guard let element1 = self.iterator1.next(), let element2 = self.iterator2.next(),
        let element3 = self.iterator3.next() else {
      self.reachedEnd = true

      return nil
    }

    return (element1, element2, element3)
  }
}

public struct LazyConvolution3Sequence <T1: Sequence, T2: Sequence, T3: Sequence>: LazySequenceProtocol {
  public typealias Iterator = LazyConvolution3Iterator<T1.Iterator, T2.Iterator, T3.Iterator>

  private let sequence1: T1
  private let sequence2: T2
  private let sequence3: T3

  internal init (_ sequence1: T1, _ sequence2: T2, _ sequence3: T3) {
    self.sequence1 = sequence1
    self.sequence2 = sequence2
    self.sequence3 = sequence3
  }

  public func makeIterator () -> Iterator {
    return Iterator(self.sequence1.makeIterator(), self.sequence2.makeIterator(), self.sequence3.makeIterator())
  }
}

/// Creates a [convolution][1] from three `Sequence`s using lazy evaluation.
///
///     print(Array(convolution([1, 2], [3, 4], [5, 6])))
///     // [(1, 3, 5), (2, 4, 6)]
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
///     - sequence3: The third `Sequence`.
/// - Returns: A convolution as a lazily evaluated `Sequence` of 3-tuples.
public func convolution <T1: Sequence, T2: Sequence, T3: Sequence> (_ sequence1: T1, _ sequence2: T2, _ sequence3: T3)
    -> LazyConvolution3Sequence<T1, T2, T3> {
  return LazyConvolution3Sequence(sequence1, sequence2, sequence3)
}
