public extension Sequence where Element: Hashable {
  /// Returns a `Dictionary` containing the duplicate elements in `self` as keys and the offsets of each duplicate
  /// element starting from zero as values.
  ///
  ///     print([0, 1, 1, 2, 2, 2, 3, 3, 3, 3].duplicates)
  ///     // [1: [2], 2: [4, 5], 3: [7, 8, 9]]
  var duplicates: [Element: [Int]] {
    var uniques = [Element]()

    return self.enumerated().reduce(into: [:]) {
      if uniques.contains($1.element) {
        $0[$1.element, default: []].append($1.offset)
      } else {
        uniques.append($1.element)
      }
    }
  }

  /// Returns a `Dictionary` containing the occurrencing elements in `self` as keys and the offsets of each
  /// occurrencing element starting from zero as values.
  ///
  ///     print([0, 1, 1, 2, 2, 2, 3, 3, 3, 3].occurrences)
  ///     // [0: [0], 1: [1, 2], 2: [3, 4, 5], 3: [6, 7, 8, 9]]
  var occurrences: [Element: [Int]] {
    return self.enumerated().reduce(into: [:]) {
      $0[$1.element, default: []].append($1.offset)
    }
  }

  /// Returns a `Dictionary` containing the occurrencing elements in `elements` as keys and the offset, starting from
  /// zero, of each occurrencing element as values.
  ///
  ///     print([0, 1, 1, 2, 2, 2, 3, 3, 3, 3].occurrences(of: [1, 3]))
  ///     // [1: [1, 2], 3: [6, 7, 8, 9]]
  ///
  /// - Parameters:
  ///   - elements: The `Element`s to get the occurrencing elements of.
  /// - Returns: A `Dictionary` containing the occurrencing elements in `elements` as keys and the offset, starting
  /// from zero, of each occurrencing element as values.
  func occurrences (of elements: [Element]) -> [Element: [Int]] {
    return self.enumerated().reduce(into: [:]) {
      if elements.contains($1.element) {
        $0[$1.element, default: []].append($1.offset)
      }
    }
  }
}
