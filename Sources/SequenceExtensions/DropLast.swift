public struct LazyDropLastIterator <T: IteratorProtocol>: IteratorProtocol {
  public typealias Element = T.Element

  private var iterator: T
  private var queue: [Element?] = []
  private let numberOfElements: Int
  private var reachedEnd = false

  internal init (_ iterator: T, _ numberOfElements: Int) {
    precondition(numberOfElements >= 0, "the number of elements to drop last must be 0 or higher")

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

    if self.queue.isEmpty {
      var numberOfElements = self.numberOfElements

      while numberOfElements >= 0 {
        self.queue.append(self.iterator.next())

        numberOfElements -= 1
      }
    }

    self.queue.append(self.iterator.next())

    if self.queue[self.numberOfElements] == nil {
      self.reachedEnd = true

      return nil
    }

    let next = self.queue[0]

    self.queue.remove(at: 0)

    return next
  }
}

public struct LazyDropLastSequence <T: Sequence>: LazySequenceProtocol {
  public typealias Iterator = LazyDropLastIterator<T.Iterator>

  private let iterator: Iterator

  internal init (_ base: T, _ numberOfElements: Int) {
    self.iterator = Iterator(base.makeIterator(), numberOfElements)
  }

  public func makeIterator () -> Iterator {
    return self.iterator
  }
}

public extension Sequence {
  func drop (last numberOfElements: Int) -> LazyDropLastSequence<Self> {
    return LazyDropLastSequence(self, numberOfElements)
  }
}
