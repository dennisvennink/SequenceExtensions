public struct LazyTakeLastIterator <T: IteratorProtocol>: IteratorProtocol {
  public typealias Element = T.Element

  private var iterator: T
  private var queue: [Element?] = []
  private let numberOfElements: Int
  private var reachedEnd = false

  internal init (_ iterator: T, _ numberOfElements: Int) {
    precondition(numberOfElements >= 0, "the number of elements to take last must be 0 or higher")

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

      while self.queue[self.numberOfElements] != nil {
        self.queue.remove(at: 0)

        self.queue.append(self.iterator.next())
      }
    }

    let next = self.queue[0]

    if next == nil {
      self.reachedEnd = true

      return nil
    }

    self.queue.remove(at: 0)

    return next
  }
}

public struct LazyTakeLastSequence <T: Sequence>: LazySequenceProtocol {
  public typealias Iterator = LazyTakeLastIterator<T.Iterator>

  private let iterator: Iterator

  internal init (_ base: T, _ numberOfElements: Int) {
    self.iterator = Iterator(base.makeIterator(), numberOfElements)
  }

  public func makeIterator () -> Iterator {
    return self.iterator
  }
}

public extension Sequence {
  func take (last numberOfElements: Int) -> LazyTakeLastSequence<Self> {
    return LazyTakeLastSequence(self, numberOfElements)
  }
}
