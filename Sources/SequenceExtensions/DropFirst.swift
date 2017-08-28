public struct LazyDropFirstIterator <T: IteratorProtocol>: IteratorProtocol {
  public typealias Element = T.Element

  private var iterator: T
  private var numberOfElements: Int
  private var didInitialiseIterator = false
  private var reachedEnd = false

  internal init (_ iterator: T, _ numberOfElements: Int) {
    precondition(numberOfElements >= 0, "the number of elements to drop first must be 0 or higher")

    self.iterator = iterator
    self.numberOfElements = numberOfElements
  }

  public mutating func next () -> Element? {
    #if DEBUG
      iterationCount += 1
    #endif

    if self.reachedEnd {
      return nil
    }

    if !self.didInitialiseIterator {
      while self.numberOfElements > 0 {
        _ = self.iterator.next()

        self.numberOfElements -= 1
      }

      self.didInitialiseIterator = true
    }

    let next = self.iterator.next()

    if next == nil {
      self.reachedEnd = true

      return nil
    }

    return next
  }
}

public struct LazyDropFirstSequence <T: Sequence>: LazySequenceProtocol {
  public typealias Iterator = LazyDropFirstIterator<T.Iterator>

  private let iterator: Iterator

  internal init (_ base: T, _ numberOfElements: Int) {
    self.iterator = Iterator(base.makeIterator(), numberOfElements)
  }

  public func makeIterator () -> Iterator {
    return self.iterator
  }
}

public extension Sequence {
  func drop (first numberOfElements: Int) -> LazyDropFirstSequence<Self> {
    return LazyDropFirstSequence(self, numberOfElements)
  }
}
