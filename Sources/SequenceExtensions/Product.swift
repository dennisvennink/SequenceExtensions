/// Creates the Cartesian product of two `Sequence`s as a `Sequence` of 2-tuples.
///
///     print(Array(product([1, 2], [3, 4])))
///     // [(1, 3), (1, 4), (2, 3), (2, 4)]
///
/// - Parameters:
///     - sequence1: The first `Sequence`.
///     - sequence2: The second `Sequence`.
/// - Returns: A Cartesian product as a `Sequence` of 2-tuples.
public func product <Sequence1: Sequence, Sequence2: Sequence> (_ sequence1: Sequence1, _ sequence2: Sequence2) ->
    AnySequence<(Sequence1.Element, Sequence2.Element)> {
  return AnySequence { () -> AnyIterator<(Sequence1.Element, Sequence2.Element)> in
    AnyIterator(
      sequence1.lazy.flatMap { element1 in
        sequence2.lazy.map { element2 in
          (element1, element2)
        }
      }.makeIterator()
    )
  }
}

/// Creates the Cartesian product of three `Sequence`s as a `Sequence` of 3-tuples.
///
///     print(Array(product([1, 2], [3, 4], [5, 6]).prefix(4)))
///     // [(1, 3, 5), (1, 3, 6), (1, 4, 5), (1, 4, 6)]
///
/// - Parameters:
///     - sequence1: The first `Sequence`.
///     - sequence2: The second `Sequence`.
///     - sequence3: The third `Sequence`.
/// - Returns: A Cartesian product as a `Sequence` of 3-tuples.
public func product <Sequence1: Sequence, Sequence2: Sequence, Sequence3: Sequence> (_ sequence1: Sequence1, _
    sequence2: Sequence2, _ sequence3: Sequence3) -> AnySequence<(Sequence1.Element, Sequence2.Element,
    Sequence3.Element)> {
  return AnySequence { () -> AnyIterator<(Sequence1.Element, Sequence2.Element, Sequence3.Element)> in
    AnyIterator(
      sequence1.lazy.flatMap { element1 in
        sequence2.lazy.flatMap { element2 in
          sequence3.lazy.map { element3 in
            (element1, element2, element3)
          }
        }
      }.makeIterator()
    )
  }
}

/// Creates the Cartesian product of four `Sequence`s as a `Sequence` of 4-tuples.
///
///     print(Array(product([1, 2], [3, 4], [5, 6], [7, 8]).prefix(4)))
///     // [(1, 3, 5, 7), (1, 3, 5, 8), (1, 3, 6, 7), (1, 3, 6, 8)]
///
/// - Parameters:
///     - sequence1: The first `Sequence`.
///     - sequence2: The second `Sequence`.
///     - sequence3: The third `Sequence`.
///     - sequence4: The fourth `Sequence`.
/// - Returns: A Cartesian product as a `Sequence` of 4-tuples.
public func product <Sequence1: Sequence, Sequence2: Sequence, Sequence3: Sequence, Sequence4: Sequence> (_ sequence1:
    Sequence1, _ sequence2: Sequence2, _ sequence3: Sequence3, _ sequence4: Sequence4) ->
    AnySequence<(Sequence1.Element, Sequence2.Element, Sequence3.Element, Sequence4.Element)> {
  return AnySequence { () -> AnyIterator<(Sequence1.Element, Sequence2.Element, Sequence3.Element, Sequence4.Element)>
      in
    AnyIterator(
      sequence1.lazy.flatMap { element1 in
        sequence2.lazy.flatMap { element2 in
          sequence3.lazy.flatMap { element3 in
            sequence4.lazy.map { element4 in
              (element1, element2, element3, element4)
            }
          }
        }
      }.makeIterator()
    )
  }
}

/// Creates the Cartesian product of five `Sequence`s as a `Sequence` of 5-tuples.
///
///     print(Array(product([1, 2], [3, 4], [5, 6], [7, 8], [9, 10]).prefix(4)))
///     // [(1, 3, 5, 7, 9), (1, 3, 5, 7, 10), (1, 3, 5, 8, 9), (1, 3, 5, 8, 10)]
///
/// - Parameters:
///     - sequence1: The first `Sequence`.
///     - sequence2: The second `Sequence`.
///     - sequence3: The third `Sequence`.
///     - sequence4: The fourth `Sequence`.
///     - sequence5: The fifth `Sequence`.
/// - Returns: A Cartesian product as a `Sequence` of 5-tuples.
public func product <Sequence1: Sequence, Sequence2: Sequence, Sequence3: Sequence, Sequence4: Sequence, Sequence5:
    Sequence> (_ sequence1: Sequence1, _ sequence2: Sequence2, _ sequence3: Sequence3, _ sequence4: Sequence4, _
    sequence5: Sequence5) -> AnySequence<(Sequence1.Element, Sequence2.Element, Sequence3.Element, Sequence4.Element,
    Sequence5.Element)> {
  return AnySequence { () -> AnyIterator<(Sequence1.Element, Sequence2.Element, Sequence3.Element, Sequence4.Element,
      Sequence5.Element)> in
    AnyIterator(
      sequence1.lazy.flatMap { element1 in
        sequence2.lazy.flatMap { element2 in
          sequence3.lazy.flatMap { element3 in
            sequence4.lazy.flatMap { element4 in
              sequence5.lazy.map { element5 in
                (element1, element2, element3, element4, element5)
              }
            }
          }
        }
      }.makeIterator()
    )
  }
}

/// Creates the Cartesian product of sixth `Sequence`s as a `Sequence` of 6-tuples.
///
///     print(Array(product([1, 2], [3, 4], [5, 6], [7, 8], [9, 10], [11, 12]).prefix(4)))
///     // [(1, 3, 5, 7, 9, 11), (1, 3, 5, 7, 9, 12), (1, 3, 5, 7, 10, 11), (1, 3, 5, 7, 10, 12)]
///
/// - Parameters:
///     - sequence1: The first `Sequence`.
///     - sequence2: The second `Sequence`.
///     - sequence3: The third `Sequence`.
///     - sequence4: The fourth `Sequence`.
///     - sequence5: The fifth `Sequence`.
///     - sequence6: The sixth `Sequence`.
/// - Returns: A Cartesian product as a `Sequence` of 6-tuples.
public func product <Sequence1: Sequence, Sequence2: Sequence, Sequence3: Sequence, Sequence4: Sequence, Sequence5:
    Sequence, Sequence6: Sequence> (_ sequence1: Sequence1, _ sequence2: Sequence2, _ sequence3: Sequence3, _
    sequence4: Sequence4, _ sequence5: Sequence5, _ sequence6: Sequence6) -> AnySequence<(Sequence1.Element,
    Sequence2.Element, Sequence3.Element, Sequence4.Element, Sequence5.Element, Sequence6.Element)> {
  return AnySequence { () -> AnyIterator<(Sequence1.Element, Sequence2.Element, Sequence3.Element, Sequence4.Element,
      Sequence5.Element, Sequence6.Element)> in
    AnyIterator(
      sequence1.lazy.flatMap { element1 in
        sequence2.lazy.flatMap { element2 in
          sequence3.lazy.flatMap { element3 in
            sequence4.lazy.flatMap { element4 in
              sequence5.lazy.flatMap { element5 in
                sequence6.lazy.map { element6 in
                  (element1, element2, element3, element4, element5, element6)
                }
              }
            }
          }
        }
      }.makeIterator()
    )
  }
}
