/// Compares whether the left-hand `Sequence` of 2-tuples is equal to the right-hand `Sequence` of 2-tuples.
///
///     print([(0, 1)] == [(0, 1)])
///     // true
///
/// - Parameters:
///   - lhs: The left-hand `Sequence` of 2-tuples.
///   - rhs: The right-hand `Sequence` of 2-tuples.
/// - Returns: A `Bool`ean value indicating whether the left-hand `Sequence` of 2-tuples is equal to the
///            right-hand `Sequence` of 2-tuples.
public func == <Sequence1: Sequence, Sequence2: Sequence, Equatable1: Equatable, Equatable2: Equatable> (lhs:
    Sequence1, rhs: Sequence2) -> Bool where Sequence1.Element == (Equatable1, Equatable2), Sequence2.Element ==
    (Equatable1, Equatable2) {
  var result = true
  var lhsIterator = lhs.makeIterator()
  var rhsIterator = rhs.makeIterator()

  while true {
    let lhsElement = lhsIterator.next()
    let rhsElement = rhsIterator.next()

    if lhsElement == nil && rhsElement == nil {
      break
    } else if lhsElement == nil || rhsElement == nil {
      result = false

      break
    } else if lhsElement != nil && rhsElement != nil {
      if lhsElement! != rhsElement! {
        return false
      }
    }
  }

  return result
}

/// Compares whether the left-hand `Sequence` of 3-tuples is equal to the right-hand `Sequence` of 3-tuples.
///
///     print([(0, 1, 2)] == [(0, 1, 2)])
///     // true
///
/// - Parameters:
///   - lhs: The left-hand `Sequence` of 3-tuples.
///   - rhs: The right-hand `Sequence` of 3-tuples.
/// - Returns: A `Bool`ean value indicating whether the left-hand `Sequence` of 3-tuples is equal to the
///            right-hand `Sequence` of 3-tuples.
public func == <Sequence1: Sequence, Sequence2: Sequence, Equatable1: Equatable, Equatable2: Equatable, Equatable3:
    Equatable> (lhs: Sequence1, rhs: Sequence2) -> Bool where Sequence1.Element == (Equatable1, Equatable2,
    Equatable3), Sequence2.Element == (Equatable1, Equatable2, Equatable3) {
  var result = true
  var lhsIterator = lhs.makeIterator()
  var rhsIterator = rhs.makeIterator()

  while true {
    let lhsElement = lhsIterator.next()
    let rhsElement = rhsIterator.next()

    if lhsElement == nil && rhsElement == nil {
      break
    } else if lhsElement == nil || rhsElement == nil {
      result = false

      break
    } else if lhsElement != nil && rhsElement != nil {
      if lhsElement! != rhsElement! {
        return false
      }
    }
  }

  return result
}

/// Compares whether the left-hand `Sequence` of 4-tuples is equal to the right-hand `Sequence` of 4-tuples.
///
///     print([(0, 1, 2, 3)] == [(0, 1, 2, 3)])
///     // true
///
/// - Parameters:
///   - lhs: The left-hand `Sequence` of 4-tuples.
///   - rhs: The right-hand `Sequence` of 4-tuples.
/// - Returns: A `Bool`ean value indicating whether the left-hand `Sequence` of 4-tuples is equal to the
///            right-hand `Sequence` of 4-tuples.
public func == <Sequence1: Sequence, Sequence2: Sequence, Equatable1: Equatable, Equatable2: Equatable, Equatable3:
    Equatable, Equatable4: Equatable> (lhs: Sequence1, rhs: Sequence2) -> Bool where Sequence1.Element == (Equatable1,
    Equatable2, Equatable3, Equatable4), Sequence2.Element == (Equatable1, Equatable2, Equatable3, Equatable4) {
  var result = true
  var lhsIterator = lhs.makeIterator()
  var rhsIterator = rhs.makeIterator()

  while true {
    let lhsElement = lhsIterator.next()
    let rhsElement = rhsIterator.next()

    if lhsElement == nil && rhsElement == nil {
      break
    } else if lhsElement == nil || rhsElement == nil {
      result = false

      break
    } else if lhsElement != nil && rhsElement != nil {
      if lhsElement! != rhsElement! {
        return false
      }
    }
  }

  return result
}

/// Compares whether the left-hand `Sequence` of 5-tuples is equal to the right-hand `Sequence` of 5-tuples.
///
///     print([(0, 1, 2, 3, 4)] == [(0, 1, 2, 3, 4)])
///     // true
///
/// - Parameters:
///   - lhs: The left-hand `Sequence` of 5-tuples.
///   - rhs: The right-hand `Sequence` of 5-tuples.
/// - Returns: A `Bool`ean value indicating whether the left-hand `Sequence` of 5-tuples is equal to the
///            right-hand `Sequence` of 5-tuples.
public func == <Sequence1: Sequence, Sequence2: Sequence, Equatable1: Equatable, Equatable2: Equatable, Equatable3:
    Equatable, Equatable4: Equatable, Equatable5: Equatable> (lhs: Sequence1, rhs: Sequence2) -> Bool where
    Sequence1.Element == (Equatable1, Equatable2, Equatable3, Equatable4, Equatable5), Sequence2.Element ==
    (Equatable1, Equatable2, Equatable3, Equatable4, Equatable5) {
  var result = true
  var lhsIterator = lhs.makeIterator()
  var rhsIterator = rhs.makeIterator()

  while true {
    let lhsElement = lhsIterator.next()
    let rhsElement = rhsIterator.next()

    if lhsElement == nil && rhsElement == nil {
      break
    } else if lhsElement == nil || rhsElement == nil {
      result = false

      break
    } else if lhsElement != nil && rhsElement != nil {
      if lhsElement! != rhsElement! {
        return false
      }
    }
  }

  return result
}

/// Compares whether the left-hand `Sequence` of 6-tuples is equal to the right-hand `Sequence` of 6-tuples.
///
///     print([(0, 1, 2, 3, 4, 5)] == [(0, 1, 2, 3, 4, 5)])
///     // true
///
/// - Parameters:
///   - lhs: The left-hand `Sequence` of 6-tuples.
///   - rhs: The right-hand `Sequence` of 6-tuples.
/// - Returns: A `Bool`ean value indicating whether the left-hand `Sequence` of 6-tuples is equal to the
///            right-hand `Sequence` of 6-tuples.
public func == <Sequence1: Sequence, Sequence2: Sequence, Equatable1: Equatable, Equatable2: Equatable, Equatable3:
    Equatable, Equatable4: Equatable, Equatable5: Equatable, Equatable6: Equatable> (lhs: Sequence1, rhs: Sequence2) ->
    Bool where Sequence1.Element == (Equatable1, Equatable2, Equatable3, Equatable4, Equatable5, Equatable6),
    Sequence2.Element == (Equatable1, Equatable2, Equatable3, Equatable4, Equatable5, Equatable6) {
  var result = true
  var lhsIterator = lhs.makeIterator()
  var rhsIterator = rhs.makeIterator()

  while true {
    let lhsElement = lhsIterator.next()
    let rhsElement = rhsIterator.next()

    if lhsElement == nil && rhsElement == nil {
      break
    } else if lhsElement == nil || rhsElement == nil {
      result = false

      break
    } else if lhsElement != nil && rhsElement != nil {
      if lhsElement! != rhsElement! {
        return false
      }
    }
  }

  return result
}
