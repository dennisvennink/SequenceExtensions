public struct LazyIntersperseIterator <T: IteratorProtocol>: IteratorProtocol {
  public typealias Element = T.Element

  private var iterator: T
  private let element: Element
  private var queue: Element?
  private var didInitialise = false
  private var shouldIntersperse = false
  private var reachedEnd = false

  internal init (_ iterator: T, _ element: Element) {
    self.iterator = iterator
    self.element = element
  }

  public mutating func next () -> Element? {
    #if DEBUG
      iterationCount += 1
    #endif

    if self.reachedEnd {
      return nil
    }

    if !self.didInitialise {
      self.queue = self.iterator.next()

      self.didInitialise = true
    }

    var next: Element?

    if self.shouldIntersperse {
      next = element

      self.shouldIntersperse = false
    } else {
      next = self.queue

      if next == nil {
        self.reachedEnd = true

        return nil
      }

      self.queue = self.iterator.next()

      if self.queue == nil {
        self.shouldIntersperse = false
      } else {
        self.shouldIntersperse = true
      }
    }

    return next
  }
}

public struct LazyIntersperseSequence <T: LazySequenceProtocol>: LazySequenceProtocol {
  public typealias Iterator = LazyIntersperseIterator<T.Iterator>

  private let iterator: Iterator

  internal init (_ base: T, _ element: Element) {
    self.iterator = Iterator(base.makeIterator(), element)
  }

  public func makeIterator () -> Iterator {
    return self.iterator
  }
}

public extension LazySequenceProtocol {
  /// Creates a lazily evaluated `Sequence` in which `element` is interspersed between the elements of `self`.
  ///
  ///     print(Array([1, 1, 1].lazy.intersperse(2)))
  ///     // [1, 2, 1, 2, 1]
  ///
  /// - Parameters:
  ///     - element: The element to intersperse.
  /// - Returns: A lazily evaluated `Sequence` in which `element` is interspersed between the elements of
  ///            `self`.
  func intersperse (_ element: Element) -> LazyIntersperseSequence<Self> {
    return LazyIntersperseSequence(self, element)
  }
}
