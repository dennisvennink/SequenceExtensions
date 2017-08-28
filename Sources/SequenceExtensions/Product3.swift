public struct LazyProduct3Iterator <T1: Sequence, T2: Sequence, T3: Sequence>: IteratorProtocol {
  public typealias Element = (T1.Element, T2.Element, T3.Element)

  private let iterator: AnyIterator<Element>

  internal init (_ sequence1: T1, _ sequence2: T2, _ sequence3: T3) {
    self.iterator = AnyIterator(
      sequence1.lazy.flatMap { element1 in
        sequence2.lazy.flatMap { element2 in
          sequence3.lazy.map { element3 in
            #if DEBUG
              iterationCount += 1
            #endif

            return (element1, element2, element3)
          }
        }
      }.makeIterator()
    )
  }

  public mutating func next () -> Element? {
    return self.iterator.next()
  }
}

public struct LazyProduct3Sequence <T1: Sequence, T2: Sequence, T3: Sequence>: LazySequenceProtocol {
  public typealias Iterator = LazyProduct3Iterator<T1, T2, T3>

  private let sequence1: T1
  private let sequence2: T2
  private let sequence3: T3

  internal init (_ sequence1: T1, _ sequence2: T2, _ sequence3: T3) {
    self.sequence1 = sequence1
    self.sequence2 = sequence2
    self.sequence3 = sequence3
  }

  public func makeIterator () -> Iterator {
    return Iterator(sequence1, sequence2, sequence3)
  }
}

public func product <T1: Sequence, T2: Sequence, T3: Sequence> (_ sequence1: T1, _ sequence2: T2, _ sequence3: T3) ->
    LazyProduct3Sequence<T1, T2, T3> {
  return LazyProduct3Sequence(sequence1, sequence2, sequence3)
}
