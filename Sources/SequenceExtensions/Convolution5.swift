public struct LazyConvolution5Iterator <T1: IteratorProtocol, T2: IteratorProtocol, T3: IteratorProtocol,
    T4: IteratorProtocol, T5: IteratorProtocol>: IteratorProtocol {
  public typealias Element = (T1.Element, T2.Element, T3.Element, T4.Element, T5.Element)

  private var iterator1: T1
  private var iterator2: T2
  private var iterator3: T3
  private var iterator4: T4
  private var iterator5: T5
  private var reachedEnd = false

  internal init (_ iterator1: T1, _ iterator2: T2, _ iterator3: T3, _ iterator4: T4, _ iterator5: T5) {
    self.iterator1 = iterator1
    self.iterator2 = iterator2
    self.iterator3 = iterator3
    self.iterator4 = iterator4
    self.iterator5 = iterator5
  }

  public mutating func next () -> Element? {
    #if DEBUG
      iterationCount += 1
    #endif

    if self.reachedEnd {
      return nil
    }

    guard let element1 = self.iterator1.next(), let element2 = self.iterator2.next(),
        let element3 = self.iterator3.next(), let element4 = self.iterator4.next(),
        let element5 = self.iterator5.next() else {
      self.reachedEnd = true

      return nil
    }

    return (element1, element2, element3, element4, element5)
  }
}

public struct LazyConvolution5Sequence <T1: Sequence, T2: Sequence, T3: Sequence, T4: Sequence, T5: Sequence>:
    LazySequenceProtocol {
  public typealias Iterator = LazyConvolution5Iterator<T1.Iterator, T2.Iterator, T3.Iterator, T4.Iterator, T5.Iterator>

  private let sequence1: T1
  private let sequence2: T2
  private let sequence3: T3
  private let sequence4: T4
  private let sequence5: T5

  internal init (_ sequence1: T1, _ sequence2: T2, _ sequence3: T3, _ sequence4: T4, _ sequence5: T5) {
    self.sequence1 = sequence1
    self.sequence2 = sequence2
    self.sequence3 = sequence3
    self.sequence4 = sequence4
    self.sequence5 = sequence5
  }

  public func makeIterator () -> Iterator {
    return Iterator(self.sequence1.makeIterator(), self.sequence2.makeIterator(), self.sequence3.makeIterator(),
      self.sequence4.makeIterator(), self.sequence5.makeIterator())
  }
}

/// Creates a [convolution][1] from five `Sequence`s using lazy evaluation.
///
///     print(Array(convolution([1, 2], [3, 4], [5, 6], [7, 8], [9, 10])))
///     // [(1, 3, 5, 7, 9), (2, 4, 6, 8, 10)]
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
///     - sequence4: The fourth `Sequence`.
///     - sequence5: The fifth `Sequence`.
/// - Returns: A convolution as a lazily evaluated `Sequence` of 5-tuples.
public func convolution <T1: Sequence, T2: Sequence, T3: Sequence, T4: Sequence, T5: Sequence> (_ sequence1: T1,
    _ sequence2: T2, _ sequence3: T3, _ sequence4: T4, _ sequence5: T5) -> LazyConvolution5Sequence<T1, T2, T3, T4, T5>
    {
  return LazyConvolution5Sequence(sequence1, sequence2, sequence3, sequence4, sequence5)
}
