public struct LazyConvolution4Iterator <T1: IteratorProtocol, T2: IteratorProtocol, T3: IteratorProtocol,
    T4: IteratorProtocol>: IteratorProtocol {
  public typealias Element = (T1.Element, T2.Element, T3.Element, T4.Element)

  private var iterator1: T1
  private var iterator2: T2
  private var iterator3: T3
  private var iterator4: T4
  private var reachedEnd = false

  internal init (_ iterator1: T1, _ iterator2: T2, _ iterator3: T3, _ iterator4: T4) {
    self.iterator1 = iterator1
    self.iterator2 = iterator2
    self.iterator3 = iterator3
    self.iterator4 = iterator4
  }

  public mutating func next () -> Element? {
    #if DEBUG
      iterationCount += 1
    #endif

    if self.reachedEnd {
      return nil
    }

    guard let element1 = self.iterator1.next(), let element2 = self.iterator2.next(),
        let element3 = self.iterator3.next(), let element4 = self.iterator4.next() else {
      self.reachedEnd = true

      return nil
    }

    return (element1, element2, element3, element4)
  }
}

public struct LazyConvolution4Sequence <T1: Sequence, T2: Sequence, T3: Sequence, T4: Sequence>: LazySequenceProtocol {
  public typealias Iterator = LazyConvolution4Iterator<T1.Iterator, T2.Iterator, T3.Iterator, T4.Iterator>

  private let sequence1: T1
  private let sequence2: T2
  private let sequence3: T3
  private let sequence4: T4

  internal init (_ sequence1: T1, _ sequence2: T2, _ sequence3: T3, _ sequence4: T4) {
    self.sequence1 = sequence1
    self.sequence2 = sequence2
    self.sequence3 = sequence3
    self.sequence4 = sequence4
  }

  public func makeIterator () -> Iterator {
    return Iterator(self.sequence1.makeIterator(), self.sequence2.makeIterator(), self.sequence3.makeIterator(),
      self.sequence4.makeIterator())
  }
}

public func convolution <T1: Sequence, T2: Sequence, T3: Sequence, T4: Sequence> (_ sequence1: T1, _ sequence2: T2,
    _ sequence3: T3, _ sequence4: T4) -> LazyConvolution4Sequence<T1, T2, T3, T4> {
  return LazyConvolution4Sequence(sequence1, sequence2, sequence3, sequence4)
}
