public extension Sequence where Element: Hashable {
  /// Returns a `Dictionary` in which the keys correspond to all `Element`s in `self` that contain duplicates and the
  /// values to their duplicates in `self` as an `Array` of `Int`eger offsets.
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

  /// Returns a `Dictionary` in which the keys correspond to all `Element`s in `self` and the values to their
  /// occurrences in `self` as an `Array` of `Int`eger offsets.
  ///
  ///     print([0, 1, 1, 2, 2, 2, 3, 3, 3, 3].occurrences)
  ///     // [0: [0], 1: [1, 2], 2: [3, 4, 5], 3: [6, 7, 8, 9]]
  var occurrences: [Element: [Int]] {
    return self.enumerated().reduce(into: [:]) {
      $0[$1.element, default: []].append($1.offset)
    }
  }

  /// Returns a `Dictionary` in which the keys correspond to the `Element`s in `elements` and the values to their
  /// occurrences in `self` as an `Array` of `Int`eger offsets.
  ///
  ///     print([0, 1, 1, 2, 2, 2, 3, 3, 3, 3].occurrences(of: [1, 3]))
  ///     // [1: [1, 2], 3: [6, 7, 8, 9]]
  ///
  /// - Parameters:
  ///   - elements: The `Element`s to get the occurrences of.
  /// - Returns: A `Dictionary` in which the keys correspond to the `Element`s in `elements` and the values to their
  ///            occurrences in `self` as an `Array` of `Int`eger offsets.
  func occurrences (of elements: [Element]) -> [Element: [Int]] {
    return self.enumerated().reduce(into: [:]) {
      if elements.contains($1.element) {
        $0[$1.element, default: []].append($1.offset)
      }
    }
  }

  /// Returns an `Array` containing the occurrences of `element` in `self` as `Int`eger offsets.
  ///
  ///     print([0, 1, 1, 2, 2, 2, 3, 3, 3, 3].occurrences(of: 2))
  ///     // [3, 4, 5]
  ///
  /// - Parameters:
  ///   - element: The `Element` to get the occurrences of.
  /// - Returns: An `Array` containing the occurrences of `element` in `self` as `Int`eger offsets.
  func occurrences (of element: Element) -> [Int] {
    return self.enumerated().reduce(into: []) {
      if element == $1.element {
        $0.append($1.offset)
      }
    }
  }
}
