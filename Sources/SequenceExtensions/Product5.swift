public struct LazyProduct5Iterator <T1: Sequence, T2: Sequence, T3: Sequence, T4: Sequence, T5: Sequence>:
    IteratorProtocol {
  public typealias Element = (T1.Element, T2.Element, T3.Element, T4.Element, T5.Element)

  private let iterator: AnyIterator<Element>

  internal init (_ sequence1: T1, _ sequence2: T2, _ sequence3: T3, _ sequence4: T4, _ sequence5: T5) {
    self.iterator = AnyIterator(
      sequence1.lazy.flatMap { element1 in
        sequence2.lazy.flatMap { element2 in
          sequence3.lazy.flatMap { element3 in
            sequence4.lazy.flatMap { element4 in
              sequence5.lazy.map { element5 in
                #if DEBUG
                  iterationCount += 1
                #endif

                return (element1, element2, element3, element4, element5)
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

public struct LazyProduct5Sequence <T1: Sequence, T2: Sequence, T3: Sequence, T4: Sequence, T5: Sequence>:
    LazySequenceProtocol {
  public typealias Iterator = LazyProduct5Iterator<T1, T2, T3, T4, T5>

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
    return Iterator(sequence1, sequence2, sequence3, sequence4, sequence5)
  }
}

/// Creates a [Cartesian product][1] from five `Sequence`s using lazy evaluation.
///
///     _ = product([1, 2], [3, 4], [5, 6], [7, 8], [9, 10]).take(first: 4)
///     // [(1, 3, 5, 7, 9), (1, 3, 5, 7, 10), (1, 3, 5, 8, 9), (1, 3, 5, 8, 10)]
///
/// - Parameters:
///     - sequence1: The first `Sequence`.
///     - sequence2: The second `Sequence`.
///     - sequence3: The third `Sequence`.
///     - sequence4: The fourth `Sequence`.
///     - sequence5: The fifth `Sequence`.
///
/// - Returns: A product as a lazily evaluated `Sequence` of 5-tuples.
///
/// [1]: https://en.wikipedia.org/wiki/Cartesian_product
public func product <T1: Sequence, T2: Sequence, T3: Sequence, T4: Sequence, T5: Sequence> (_ sequence1: T1,
    _ sequence2: T2, _ sequence3: T3, _ sequence4: T4, _ sequence5: T5) -> LazyProduct5Sequence<T1, T2, T3, T4, T5> {
  return LazyProduct5Sequence(sequence1, sequence2, sequence3, sequence4, sequence5)
}
