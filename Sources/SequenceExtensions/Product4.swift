public struct LazyProduct4Iterator <T1: Sequence, T2: Sequence, T3: Sequence, T4: Sequence>: IteratorProtocol {
  public typealias Element = (T1.Element, T2.Element, T3.Element, T4.Element)

  private let iterator: AnyIterator<Element>

  internal init (_ sequence1: T1, _ sequence2: T2, _ sequence3: T3, _ sequence4: T4) {
    self.iterator = AnyIterator(
      sequence1.lazy.flatMap { element1 in
        sequence2.lazy.flatMap { element2 in
          sequence3.lazy.flatMap { element3 in
            sequence4.lazy.map { element4 in
              #if DEBUG
                iterationCount += 1
              #endif

              return (element1, element2, element3, element4)
            }
          }
        }
      }.makeIterator()
    )
  }

  public mutating func next () -> Element? {
    return self.iterator.next()
  }
}

public struct LazyProduct4Sequence <T1: Sequence, T2: Sequence, T3: Sequence, T4: Sequence>: LazySequenceProtocol {
  public typealias Iterator = LazyProduct4Iterator<T1, T2, T3, T4>

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
    return Iterator(sequence1, sequence2, sequence3, sequence4)
  }
}

public func product <T1: Sequence, T2: Sequence, T3: Sequence, T4: Sequence> (_ sequence1: T1, _ sequence2: T2,
    _ sequence3: T3, _ sequence4: T4) -> LazyProduct4Sequence<T1, T2, T3, T4> {
  return LazyProduct4Sequence(sequence1, sequence2, sequence3, sequence4)
}
