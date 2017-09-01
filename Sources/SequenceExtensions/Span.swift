public extension LazySequenceProtocol {
  /// Creates a tuple of which the first element is a lazily evaluated `Sequence` that contains the initial,
  /// consecutive elements that satisfy the given predicate and the second element is a lazily evaluated `Sequence`
  /// that contains the remainder of the list.
  ///
  ///     let (satisfiedElements, remainderElements) = [1, 2, 3, 4, 1, 2, 3, 4].lazy.span{$0 < 3}
  ///
  ///     print(Array(satisfiedElements))
  ///     // [1, 2]
  ///
  ///     print(Array(remainderElements))
  ///     // [3, 4, 1, 2, 3, 4]
  ///
  /// - Parameters:
  ///     - predicate: A closure that takes an element of the sequence as its argument and returns a Boolean value
  ///                  indicating whether the element should be included in the first element of the result.
  /// - Returns: A tuple of which the first element is a lazily evaluated `Sequence` that contains the initial,
  ///            consecutive elements that satisfy the given predicate and the second element is a lazily evaluated
  ///            `Sequence` that contains the remainder of the list.
  func span (_ predicate: @escaping (Element) -> Bool) -> (LazyTakeWhileSequence<Self>,
      LazyDropWhileSequence<Elements>) {
    return (self.take(while: predicate), self.drop(while: predicate))
  }
}
