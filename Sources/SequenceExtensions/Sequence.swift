public extension Sequence where Element: Hashable {
  /// Returns a `Dictionary` containing the occurrence of each value.
  ///
  ///     print([0, 1, 1, 2, 2, 2].occurrences)
  ///     // [0: 1, 1: 2, 2: 3]
  var occurrences: [Element: Int] {
    return self.reduce(into: [:]) { $0[$1, default: 0] += 1 }
  }
}

public extension Sequence where Element: Equatable {
  /// Returns an `Array` containing all unique values.
  ///
  ///     print([0, 1, 1, 2, 2, 2].uniques)
  ///     // [0, 1, 2]
  var uniques: [Element] {
    return self.reduce(into: []) {
      if !$0.contains($1) {
        $0.append($1)
      }
    }
  }

  /// Returns an `Array` containing all duplicate values.
  ///
  ///     print([0, 1, 1, 2, 2, 2].duplicates)
  ///     // [1, 2, 2]
  ///
  /// - Note: To get unique duplicate values call `duplicates.uniques`.
  var duplicates: [Element] {
    var uniques = [Element]()

    return self.reduce(into: []) {
      if uniques.contains($1) {
        $0.append($1)
      } else {
        uniques.append($1)
      }
    }
  }
}
