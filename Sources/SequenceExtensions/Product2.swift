public struct LazyProduct2Iterator <T1: Sequence, T2: Sequence>: IteratorProtocol {
  public typealias Element = (T1.Element, T2.Element)

  private let iterator: AnyIterator<Element>

  internal init (_ sequence1: T1, _ sequence2: T2) {
    self.iterator = AnyIterator(
      sequence1.lazy.flatMap { element1 in
        sequence2.lazy.map { element2 in
          #if DEBUG
            iterationCount += 1
          #endif

          return (element1, element2)
        }
      }.makeIterator()
    )
  }

  public mutating func next () -> Element? {
    return self.iterator.next()
  }
}

public struct LazyProduct2Sequence <T1: Sequence, T2: Sequence>: LazySequenceProtocol {
  public typealias Iterator = LazyProduct2Iterator<T1, T2>

  private let iterator: Iterator

  internal init (_ sequence1: T1, _ sequence2: T2) {
    self.iterator = Iterator(sequence1, sequence2)
  }

  public func makeIterator () -> Iterator {
    return self.iterator
  }
}

public func product <T1: Sequence, T2: Sequence> (_ sequence1: T1, _ sequence2: T2) -> LazyProduct2Sequence<T1, T2> {
  return LazyProduct2Sequence(sequence1, sequence2)
}
