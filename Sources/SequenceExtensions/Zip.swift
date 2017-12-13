/// Creates the zip of three `Sequence`s as a `Sequence` of 3-tuples.
///
///     print(Array(zip([1, 2], [3, 4], [5, 6])))
///     // [(1, 3, 5), (2, 4, 6)]
///
/// - Attention:
///     - If the `Sequence`s are of different lengths, the resulting `Sequence` is the same length as the shortest
///       `Sequence`.
/// - Parameters:
///     - sequence1: The first `Sequence`.
///     - sequence2: The second `Sequence`.
///     - sequence3: The third `Sequence`.
/// - Returns: A zip as a `Sequence` of 3-tuples.
public func zip <Sequence1: Sequence, Sequence2: Sequence, Sequence3: Sequence> (_ sequence1: Sequence1, _ sequence2:
    Sequence2, _ sequence3: Sequence3) -> AnySequence<(Sequence1.Element, Sequence2.Element, Sequence3.Element)> {
  return AnySequence { () -> AnyIterator<(Sequence1.Element, Sequence2.Element, Sequence3.Element)> in
    var reachedEnd = false
    var iterator1 = sequence1.makeIterator()
    var iterator2 = sequence2.makeIterator()
    var iterator3 = sequence3.makeIterator()

    return AnyIterator { () -> (Sequence1.Element, Sequence2.Element, Sequence3.Element)? in
      if reachedEnd {
        return nil
      }

      guard let element1 = iterator1.next(), let element2 = iterator2.next(), let element3 = iterator3.next() else {
        reachedEnd = true

        return nil
      }

      return (element1, element2, element3)
    }
  }
}

/// Creates the zip of four `Sequence`s as a `Sequence` of 4-tuples.
///
///     print(Array(zip([1, 2], [3, 4], [5, 6], [7, 8])))
///     // [(1, 3, 5, 7), (2, 4, 6, 8)]
///
/// - Attention:
///     - If the `Sequence`s are of different lengths, the resulting `Sequence` is the same length as the shortest
///       `Sequence`.
/// - Parameters:
///     - sequence1: The first `Sequence`.
///     - sequence2: The second `Sequence`.
///     - sequence3: The third `Sequence`.
///     - sequence4: The fourth `Sequence`.
/// - Returns: A zip as a `Sequence` of 4-tuples.
public func zip <Sequence1: Sequence, Sequence2: Sequence, Sequence3: Sequence, Sequence4: Sequence> (_ sequence1:
    Sequence1, _ sequence2: Sequence2, _ sequence3: Sequence3, _ sequence4: Sequence4) ->
    AnySequence<(Sequence1.Element, Sequence2.Element, Sequence3.Element, Sequence4.Element)> {
  return AnySequence { () -> AnyIterator<(Sequence1.Element, Sequence2.Element, Sequence3.Element, Sequence4.Element)>
      in
    var reachedEnd = false
    var iterator1 = sequence1.makeIterator()
    var iterator2 = sequence2.makeIterator()
    var iterator3 = sequence3.makeIterator()
    var iterator4 = sequence4.makeIterator()

    return AnyIterator { () -> (Sequence1.Element, Sequence2.Element, Sequence3.Element, Sequence4.Element)? in
      if reachedEnd {
        return nil
      }

      guard let element1 = iterator1.next(), let element2 = iterator2.next(), let element3 = iterator3.next(), let
          element4 = iterator4.next() else {
        reachedEnd = true

        return nil
      }

      return (element1, element2, element3, element4)
    }
  }
}

/// Creates the zip of five `Sequence`s as a `Sequence` of 5-tuples.
///
///     print(Array(zip([1, 2], [3, 4], [5, 6], [7, 8], [9, 10])))
///     // [(1, 3, 5, 7, 9), (2, 4, 6, 8, 10)]
///
/// - Attention:
///     - If the `Sequence`s are of different lengths, the resulting `Sequence` is the same length as the shortest
///       `Sequence`.
/// - Parameters:
///     - sequence1: The first `Sequence`.
///     - sequence2: The second `Sequence`.
///     - sequence3: The third `Sequence`.
///     - sequence4: The fourth `Sequence`.
///     - sequence5: The fifth `Sequence`.
/// - Returns: A zip as a `Sequence` of 5-tuples.
public func zip <Sequence1: Sequence, Sequence2: Sequence, Sequence3: Sequence, Sequence4: Sequence, Sequence5:
    Sequence> (_ sequence1: Sequence1, _ sequence2: Sequence2, _ sequence3: Sequence3, _ sequence4: Sequence4, _
    sequence5: Sequence5) -> AnySequence<(Sequence1.Element, Sequence2.Element, Sequence3.Element, Sequence4.Element,
    Sequence5.Element)> {
  return AnySequence { () -> AnyIterator<(Sequence1.Element, Sequence2.Element, Sequence3.Element, Sequence4.Element,
      Sequence5.Element)> in
    var reachedEnd = false
    var iterator1 = sequence1.makeIterator()
    var iterator2 = sequence2.makeIterator()
    var iterator3 = sequence3.makeIterator()
    var iterator4 = sequence4.makeIterator()
    var iterator5 = sequence5.makeIterator()

    return AnyIterator { () -> (Sequence1.Element, Sequence2.Element, Sequence3.Element, Sequence4.Element,
        Sequence5.Element)? in
      if reachedEnd {
        return nil
      }

      guard let element1 = iterator1.next(), let element2 = iterator2.next(), let element3 = iterator3.next(), let
          element4 = iterator4.next(), let element5 = iterator5.next() else {
        reachedEnd = true

        return nil
      }

      return (element1, element2, element3, element4, element5)
    }
  }
}

/// Creates the zip of six `Sequence`s as a `Sequence` of 6-tuples.
///
///     print(Array(zip([1, 2], [3, 4], [5, 6], [7, 8], [9, 10], [11, 12])))
///     // [(1, 3, 5, 7, 9, 11), (2, 4, 6, 8, 10, 12)]
///
/// - Attention:
///     - If the `Sequence`s are of different lengths, the resulting `Sequence` is the same length as the shortest
///       `Sequence`.
/// - Parameters:
///     - sequence1: The first `Sequence`.
///     - sequence2: The second `Sequence`.
///     - sequence3: The third `Sequence`.
///     - sequence4: The fourth `Sequence`.
///     - sequence5: The fifth `Sequence`.
///     - sequence6: The sixth `Sequence`.
/// - Returns: A zip as a `Sequence` of 6-tuples.
public func zip <Sequence1: Sequence, Sequence2: Sequence, Sequence3: Sequence, Sequence4: Sequence, Sequence5:
    Sequence, Sequence6: Sequence> (_ sequence1: Sequence1, _ sequence2: Sequence2, _ sequence3: Sequence3, _
    sequence4: Sequence4, _ sequence5: Sequence5, _ sequence6: Sequence6) -> AnySequence<(Sequence1.Element,
    Sequence2.Element, Sequence3.Element, Sequence4.Element, Sequence5.Element, Sequence6.Element)> {
  return AnySequence { () -> AnyIterator<(Sequence1.Element, Sequence2.Element, Sequence3.Element, Sequence4.Element,
      Sequence5.Element, Sequence6.Element)> in
    var reachedEnd = false
    var iterator1 = sequence1.makeIterator()
    var iterator2 = sequence2.makeIterator()
    var iterator3 = sequence3.makeIterator()
    var iterator4 = sequence4.makeIterator()
    var iterator5 = sequence5.makeIterator()
    var iterator6 = sequence6.makeIterator()

    return AnyIterator { () -> (Sequence1.Element, Sequence2.Element, Sequence3.Element, Sequence4.Element,
        Sequence5.Element, Sequence6.Element)? in
      if reachedEnd {
        return nil
      }

      guard let element1 = iterator1.next(), let element2 = iterator2.next(), let element3 = iterator3.next(), let
          element4 = iterator4.next(), let element5 = iterator5.next(), let element6 = iterator6.next() else {
        reachedEnd = true

        return nil
      }

      return (element1, element2, element3, element4, element5, element6)
    }
  }
}
