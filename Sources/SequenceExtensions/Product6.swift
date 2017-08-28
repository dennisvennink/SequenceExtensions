public struct LazyProduct6Iterator <T1: Sequence, T2: Sequence, T3: Sequence, T4: Sequence, T5: Sequence,
    T6: Sequence>: IteratorProtocol {
  public typealias Element = (T1.Element, T2.Element, T3.Element, T4.Element, T5.Element, T6.Element)

  private let iterator: AnyIterator<Element>

  internal init (_ sequence1: T1, _ sequence2: T2, _ sequence3: T3, _ sequence4: T4, _ sequence5: T5, _ sequence6: T6)
      {
    self.iterator = AnyIterator(
      sequence1.lazy.flatMap { element1 in
        sequence2.lazy.flatMap { element2 in
          sequence3.lazy.flatMap { element3 in
            sequence4.lazy.flatMap { element4 in
              sequence5.lazy.flatMap { element5 in
                sequence6.lazy.map { element6 in
                  #if DEBUG
                    iterationCount += 1
                  #endif

                  return (element1, element2, element3, element4, element5, element6)
                }
              }
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

public struct LazyProduct6Sequence <T1: Sequence, T2: Sequence, T3: Sequence, T4: Sequence, T5: Sequence,
    T6: Sequence>: LazySequenceProtocol {
  public typealias Iterator = LazyProduct6Iterator<T1, T2, T3, T4, T5, T6>

  private let sequence1: T1
  private let sequence2: T2
  private let sequence3: T3
  private let sequence4: T4
  private let sequence5: T5
  private let sequence6: T6

  internal init (_ sequence1: T1, _ sequence2: T2, _ sequence3: T3, _ sequence4: T4, _ sequence5: T5, _ sequence6: T6)
      {
    self.sequence1 = sequence1
    self.sequence2 = sequence2
    self.sequence3 = sequence3
    self.sequence4 = sequence4
    self.sequence5 = sequence5
    self.sequence6 = sequence6
  }

  public func makeIterator () -> Iterator {
    return Iterator(sequence1, sequence2, sequence3, sequence4, sequence5, sequence6)
  }
}

public func product <T1: Sequence, T2: Sequence, T3: Sequence, T4: Sequence, T5: Sequence, T6: Sequence>
    (_ sequence1: T1, _ sequence2: T2, _ sequence3: T3, _ sequence4: T4, _ sequence5: T5, _ sequence6: T6) ->
    LazyProduct6Sequence<T1, T2, T3, T4, T5, T6> {
  return LazyProduct6Sequence(sequence1, sequence2, sequence3, sequence4, sequence5, sequence6)
}
