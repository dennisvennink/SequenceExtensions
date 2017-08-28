public struct LazyConvolution6Iterator <T1: IteratorProtocol, T2: IteratorProtocol, T3: IteratorProtocol,
    T4: IteratorProtocol, T5: IteratorProtocol, T6: IteratorProtocol>: IteratorProtocol {
  public typealias Element = (T1.Element, T2.Element, T3.Element, T4.Element, T5.Element, T6.Element)

  private var iterator1: T1
  private var iterator2: T2
  private var iterator3: T3
  private var iterator4: T4
  private var iterator5: T5
  private var iterator6: T6
  private var reachedEnd = false

  internal init (_ iterator1: T1, _ iterator2: T2, _ iterator3: T3, _ iterator4: T4, _ iterator5: T5, _ iterator6: T6)
      {
    self.iterator1 = iterator1
    self.iterator2 = iterator2
    self.iterator3 = iterator3
    self.iterator4 = iterator4
    self.iterator5 = iterator5
    self.iterator6 = iterator6
  }

  public mutating func next () -> Element? {
    #if DEBUG
      iterationCount += 1
    #endif

    if self.reachedEnd {
      return nil
    }

    guard let element1 = self.iterator1.next(), let element2 = self.iterator2.next(),
        let element3 = self.iterator3.next(), let element4 = self.iterator4.next(),
        let element5 = self.iterator5.next(), let element6 = self.iterator6.next() else {
      self.reachedEnd = true

      return nil
    }

    return (element1, element2, element3, element4, element5, element6)
  }
}

public struct LazyConvolution6Sequence <T1: Sequence, T2: Sequence, T3: Sequence, T4: Sequence, T5: Sequence,
    T6: Sequence>: LazySequenceProtocol {
  public typealias Iterator = LazyConvolution6Iterator<T1.Iterator, T2.Iterator, T3.Iterator, T4.Iterator, T5.Iterator,
    T6.Iterator>

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
    return Iterator(self.sequence1.makeIterator(), self.sequence2.makeIterator(), self.sequence3.makeIterator(),
      self.sequence4.makeIterator(), self.sequence5.makeIterator(), self.sequence6.makeIterator())
  }
}

public func convolution <T1: Sequence, T2: Sequence, T3: Sequence, T4: Sequence, T5: Sequence, T6: Sequence>
    (_ sequence1: T1, _ sequence2: T2, _ sequence3: T3, _ sequence4: T4, _ sequence5: T5, _ sequence6: T6) ->
    LazyConvolution6Sequence<T1, T2, T3, T4, T5, T6> {
  return LazyConvolution6Sequence(sequence1, sequence2, sequence3, sequence4, sequence5, sequence6)
}
