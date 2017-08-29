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

/// Creates a [Cartesian product][1] from three `Sequence`s using lazy evaluation.
///
///     _ = product([1, 2], [3, 4], [5, 6]).take(first: 4)
///     // [(1, 3, 5), (1, 3, 6), (1, 4, 5), (1, 4, 6)]
///
/// - Parameters:
///     - sequence1: The first `Sequence`.
///     - sequence2: The second `Sequence`.
///     - sequence3: The third `Sequence`.
///
/// - Returns: A product as a lazily evaluated `Sequence` of 3-tuples.
///
/// [1]: https://en.wikipedia.org/wiki/Cartesian_product
public func product <T1: Sequence, T2: Sequence, T3: Sequence> (_ sequence1: T1, _ sequence2: T2, _ sequence3: T3) ->
    LazyProduct3Sequence<T1, T2, T3> {
  return LazyProduct3Sequence(sequence1, sequence2, sequence3)
}
