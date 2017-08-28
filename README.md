# SequenceExtensions

![](https://img.shields.io/badge/Language-Swift%204-F04C3E.svg) [![](https://img.shields.io/badge/License-MIT-lightgrey.svg)](https://github.com/dennisvennink/SequenceExtensions/blob/master/LICENSE.md)

_SequenceExtensions_ is a library that adds various [lazily-implemented](https://en.wikipedia.org/wiki/Lazy_evaluation) extensions to the [`Sequence`](https://developer.apple.com/documentation/swift/sequence) protocol. Heavily inspired by Haskell's `Prelude` and Python's `itertools` libraries.

## Table of Contents

- [Installation](#installation)
    - [Swift Package Manager](#swift-package-manager)
- [Testing](#testing)
- [API](#api)
    - [Operators](#operators)
        - [`++(_:_:)`](#__)
    - [Free Functions](#free-functions)
        - [`convolution(` `_:_:` `_:_:_:` `_:_:_:_:` `_:_:_:_:_:` `_:_:_:_:_:_:` `)`](#convolution-__-___-____-_____-______-)
        - [`product(` `_:_:` `_:_:_:` `_:_:_:_:` `_:_:_:_:_:` `_:_:_:_:_:_:` `)`](#product-__-___-____-_____-______-)
    - [Property Extensions on `Sequence`](#property-extensions-on-sequence)
        - [`cycle`](#cycle)
    - [Method Extensions on `Sequence`](#method-extensions-on-sequence)
        - `drop(` [`first:`](#dropfirst) [`last:`](#droplast) `)`
        - `take(` [`first:`](#takefirst) [`last:`](#takelast) `)`

## Installation

### Swift Package Manager

To install this package, add it to your project's `Package.swift` as a dependency:

```swift
.package(url: "https://github.com/dennisvennink/SequenceExtensions", from: "0.1.0")
```

Don't forget to specify the tools version at the top:

```swift
// swift-tools-version:4.0
```

Then, `import` it into your project:

```swift
import SequenceExtensions
```

## Testing

To perform the tests, run:

```
swift test -Xswiftc -D -Xswiftc DEBUG
```

## API

### Operators

#### `++(_:_:)`

Lazily appends the `Sequence` of the right-hand side to the `Sequence` on the left-hand side. If the `Sequence` on the left-hand side is not finite, the result is the `Sequence` on the left-hand side.

##### Declarations

```swift
infix operator ++

func ++ <T: Sequence> (lhs: T, rhs: T) -> LazyAppendSequence<T>
```

##### Examples

```swift
let results = [1, 2] ++ [3, 4]
let expectedResults = [1, 2, 3, 4]
```

##### Parameters

- `lhs` The `Sequence` on the left-hand side.
- `rhs` The `Sequence`  on the right-hand side.

##### Returns

A lazy sequence that appends the `Sequence` of the right-hand side to the `Sequence` on the left-hand side. If the `Sequence` on the left-hand side is not finite, the result is the `Sequence` on the left-hand side.

### Free Functions

#### `convolution(` `_:_:` `_:_:_:` `_:_:_:_:` `_:_:_:_:_:` `_:_:_:_:_:_:` `)`

Creates a [convolution](https://en.wikipedia.org/wiki/Convolution_(computer_science)) as a lazy `Sequence` of n-tuples from two or more (up to six) `Sequence`s. If the `Sequence`s are of different lengths, the resulting `Sequence` is the same length as the shortest `Sequence`. Is identical to Swift's [`zip(_:_:)`](https://developer.apple.com/documentation/swift/1541125-zip), but supports arities up to 6.

##### Declarations

```swift
func convolution <T1: Sequence, T2: Sequence> (_ sequence1: T1, _ sequence2: T2) -> LazyConvolution2Sequence<T1, T2>
```

```swift
func convolution <T1: Sequence, T2: Sequence, T3: Sequence> (_ sequence1: T1, _ sequence2: T2, _ sequence3: T3) -> LazyConvolution3Sequence<T1, T2, T3>
```

```swift
func convolution <T1: Sequence, T2: Sequence, T3: Sequence, T4: Sequence> (_ sequence1: T1, _ sequence2: T2, _ sequence3: T3, _ sequence4: T4) -> LazyConvolution4Sequence<T1, T2, T3, T4>
```

```swift
func convolution <T1: Sequence, T2: Sequence, T3: Sequence, T4: Sequence, T5: Sequence> (_ sequence1: T1, _ sequence2: T2, _ sequence3: T3, _ sequence4: T4, _ sequence5: T5) -> LazyConvolution5Sequence<T1, T2, T3, T4, T5>
```

```swift
func convolution <T1: Sequence, T2: Sequence, T3: Sequence, T4: Sequence, T5: Sequence, T6: Sequence> (_ sequence1: T1, _ sequence2: T2, _ sequence3: T3, _ sequence4: T4, _ sequence5: T5, _ sequence6: T6) -> LazyConvolution6Sequence<T1, T2, T3, T4, T5, T6>
```

##### Examples

```swift
let results = convolution([1, 2], [3, 4])
let expectedResults = [(1, 3), (2, 4)]
```

```swift
let results = convolution([1, 2], [3, 4], [5, 6])
let expectedResults = [(1, 3, 5), (2, 4, 6)]
```

```swift
let results = convolution([1, 2], [3, 4], [5, 6], [7, 8])
let expectedResults = [(1, 3, 5, 7), (2, 4, 6, 8)]
```

```swift
let results = convolution([1, 2], [3, 4], [5, 6], [7, 8], [9, 10])
let expectedResults = [(1, 3, 5, 7, 9), (2, 4, 6, 8, 10)]
```

```swift
let results = convolution([1, 2], [3, 4], [5, 6], [7, 8], [9, 10], [11, 12])
let expectedResults = [(1, 3, 5, 7, 9, 11), (2, 4, 6, 8, 10, 12)]
```

##### Parameters

- `sequence1` The first `Sequence`.
- `sequence2` The second `Sequence`.
- `sequence3` The third `Sequence` (from arity 3 and up).
- `sequence4` The fourth `Sequence` (from arity 4 and up).
- `sequence5` The fifth `Sequence` (from arity 5 and up).
- `sequence6` The sixth `Sequence` (arity 6).

##### Returns

A convolution as a lazy sequence of n-tuples.

#### `product(` `_:_:` `_:_:_:` `_:_:_:_:` `_:_:_:_:_:` `_:_:_:_:_:_:` `)`

Creates a [Cartesian product](https://en.wikipedia.org/wiki/Cartesian_product) as a lazy `Sequence` of n-tuples from two or more `Sequence`s (up to six).

##### Examples

```swift
let results = product([1, 2], [3, 4])
let expectedResults = [(1, 3), (1, 4), (2, 3), (2, 4)]
```

```swift
let results = product([1, 2], [3, 4], [5, 6])
let expectedResults = [(1, 3, 5), (1, 3, 6), (1, 4, 5), (1, 4, 6), (2, 3, 5), (2, 3, 6), (2, 4, 5), (2, 4, 6)]
```

```swift
let results = product([1, 2], [3, 4], [5, 6], [7, 8])
let expectedResults = [(1, 3, 5, 7), (1, 3, 5, 8), (1, 3, 6, 7), (1, 3, 6, 8), (1, 4, 5, 7), (1, 4, 5, 8), (1, 4, 6, 7), (1, 4, 6, 8), (2, 3, 5, 7), (2, 3, 5, 8), (2, 3, 6, 7), (2, 3, 6, 8), (2, 4, 5, 7), (2, 4, 5, 8), (2, 4, 6, 7), (2, 4, 6, 8)]
```

```swift
let results = product([1, 2], [3, 4], [5, 6], [7, 8], [9, 10])
let expectedResults = [(1, 3, 5, 7, 9), (1, 3, 5, 7, 10), (1, 3, 5, 8, 9), (1, 3, 5, 8, 10), (1, 3, 6, 7, 9), (1, 3, 6, 7, 10), (1, 3, 6, 8, 9), (1, 3, 6, 8, 10), (1, 4, 5, 7, 9), (1, 4, 5, 7, 10), (1, 4, 5, 8, 9), (1, 4, 5, 8, 10), (1, 4, 6, 7, 9), (1, 4, 6, 7, 10), (1, 4, 6, 8, 9), (1, 4, 6, 8, 10), (2, 3, 5, 7, 9), (2, 3, 5, 7, 10), (2, 3, 5, 8, 9), (2, 3, 5, 8, 10), (2, 3, 6, 7, 9), (2, 3, 6, 7, 10), (2, 3, 6, 8, 9), (2, 3, 6, 8, 10), (2, 4, 5, 7, 9), (2, 4, 5, 7, 10), (2, 4, 5, 8, 9), (2, 4, 5, 8, 10), (2, 4, 6, 7, 9), (2, 4, 6, 7, 10), (2, 4, 6, 8, 9), (2, 4, 6, 8, 10)]
```

```swift
let results = product([1, 2], [3, 4], [5, 6], [7, 8], [9, 10], [11, 12])
let expectedResults = [(1, 3, 5, 7, 9, 11), (1, 3, 5, 7, 9, 12), (1, 3, 5, 7, 10, 11), (1, 3, 5, 7, 10, 12), (1, 3, 5, 8, 9, 11), (1, 3, 5, 8, 9, 12), (1, 3, 5, 8, 10, 11), (1, 3, 5, 8, 10, 12), (1, 3, 6, 7, 9, 11), (1, 3, 6, 7, 9, 12), (1, 3, 6, 7, 10, 11), (1, 3, 6, 7, 10, 12), (1, 3, 6, 8, 9, 11), (1, 3, 6, 8, 9, 12), (1, 3, 6, 8, 10, 11), (1, 3, 6, 8, 10, 12), (1, 4, 5, 7, 9, 11), (1, 4, 5, 7, 9, 12), (1, 4, 5, 7, 10, 11), (1, 4, 5, 7, 10, 12), (1, 4, 5, 8, 9, 11), (1, 4, 5, 8, 9, 12), (1, 4, 5, 8, 10, 11), (1, 4, 5, 8, 10, 12), (1, 4, 6, 7, 9, 11), (1, 4, 6, 7, 9, 12), (1, 4, 6, 7, 10, 11), (1, 4, 6, 7, 10, 12), (1, 4, 6, 8, 9, 11), (1, 4, 6, 8, 9, 12), (1, 4, 6, 8, 10, 11), (1, 4, 6, 8, 10, 12), (2, 3, 5, 7, 9, 11), (2, 3, 5, 7, 9, 12), (2, 3, 5, 7, 10, 11), (2, 3, 5, 7, 10, 12), (2, 3, 5, 8, 9, 11), (2, 3, 5, 8, 9, 12), (2, 3, 5, 8, 10, 11), (2, 3, 5, 8, 10, 12), (2, 3, 6, 7, 9, 11), (2, 3, 6, 7, 9, 12), (2, 3, 6, 7, 10, 11), (2, 3, 6, 7, 10, 12), (2, 3, 6, 8, 9, 11), (2, 3, 6, 8, 9, 12), (2, 3, 6, 8, 10, 11), (2, 3, 6, 8, 10, 12), (2, 4, 5, 7, 9, 11), (2, 4, 5, 7, 9, 12), (2, 4, 5, 7, 10, 11), (2, 4, 5, 7, 10, 12), (2, 4, 5, 8, 9, 11), (2, 4, 5, 8, 9, 12), (2, 4, 5, 8, 10, 11), (2, 4, 5, 8, 10, 12), (2, 4, 6, 7, 9, 11), (2, 4, 6, 7, 9, 12), (2, 4, 6, 7, 10, 11), (2, 4, 6, 7, 10, 12), (2, 4, 6, 8, 9, 11), (2, 4, 6, 8, 9, 12), (2, 4, 6, 8, 10, 11), (2, 4, 6, 8, 10, 12)]
```

##### Declarations

```swift
func product <T1: Sequence, T2: Sequence> (_ sequence1: T1, _ sequence2: T2) -> LazyProduct2Sequence<T1, T2>
```

```swift
func product <T1: Sequence, T2: Sequence, T3: Sequence> (_ sequence1: T1, _ sequence2: T2, _ sequence3: T3) -> LazyProduct3Sequence<T1, T2, T3>
```

```swift
func product <T1: Sequence, T2: Sequence, T3: Sequence, T4: Sequence> (_ sequence1: T1, _ sequence2: T2, _ sequence3: T3, _ sequence4: T4) -> LazyProduct4Sequence<T1, T2, T3, T4>
```

```swift
func product <T1: Sequence, T2: Sequence, T3: Sequence, T4: Sequence, T5: Sequence> (_ sequence1: T1, _ sequence2: T2, _ sequence3: T3, _ sequence4: T4, _ sequence5: T5) -> LazyProduct5Sequence<T1, T2, T3, T4, T5>
```

```swift
func product <T1: Sequence, T2: Sequence, T3: Sequence, T4: Sequence, T5: Sequence, T6: Sequence> (_ sequence1: T1, _ sequence2: T2, _ sequence3: T3, _ sequence4: T4, _ sequence5: T5, _ sequence6: T6) -> LazyProduct6Sequence<T1, T2, T3, T4, T5, T6>
```

##### Parameters

- `sequence1` The first `Sequence`.
- `sequence2` The second `Sequence`.
- `sequence3` The third `Sequence` (from arity 3 and up).
- `sequence4` The fourth `Sequence` (from arity 4 and up).
- `sequence5` The fifth `Sequence` (from arity 5 and up).
- `sequence6` The sixth `Sequence` (arity 6).

##### Returns

A Cartesian product as a lazy `Sequence` of n-tuples.

### Property Extensions on `Sequence`

#### `cycle`

Turns any `Sequence` into a circular lazy `Sequence`, thereby infinitely repeating itself.

##### Declaration

```swift
var cycle: LazyCycleSequence<Self>
```

##### Example

```swift
let results = [1, 2, 3].cycle.take(first: 10)
let expectedResults = [1, 2, 3, 1, 2, 3, 1, 2, 3, 1]
```

##### Returns

A lazy circular `Sequence` that infinitely repeats itself.

### Method Extensions on `Sequence`

#### `drop(first:)`

Drops the first number of elements of `self`.

##### Declaration

```swift
func drop (first numberOfElements: Int) -> LazyDropFirstSequence<Self>
```

##### Example

```swift
let results = [1, 2, 3, 4, 5].drop(first: 3)
let expectedResults = [4, 5]
```

##### Parameters

- `numberOfElements` An `Int` specifying the number of elements to drop from the start of `self`.

##### Returns

A lazy `Sequence` with the first number of elements dropped from `self`.

#### `drop(last:)`

Drops the last number of elements of `self`. Should only be used with finite `Sequence`s.

##### Declaration

```swift
func drop (last numberOfElements: Int) -> LazyDropLastSequence<Self>
```

##### Example

```swift
let results = [1, 2, 3, 4, 5].drop(last: 3)
let expectedResults = [1, 2]
```

##### Parameters

- `numberOfElements` An `Int` specifying the number of elements to drop from the end of `self`.

##### Returns

A lazy `Sequence` with the last number of elements dropped from `self`.

#### `take(first:)`

Takes the first number of elements from `self`. Is similar to [`prefix(_ maxLength:)`](https://developer.apple.com/documentation/swift/sequence/2886011-prefix), but `take(first:)` will actually guarantee to return a lazy `Sequence` when operating on a lazy `Sequence`<sup>[*](https://bugs.swift.org/browse/SR-5754)</sup>.

##### Declaration

```swift
func take (first numberOfElements: Int) -> LazyTakeFirstSequence<Self>
```

##### Example

```swift
let results = [1, 2, 3, 4, 5].take(first: 3)
let expectedResults = [1, 2, 3]
```

##### Parameters

- `numberOfElements` An `Int` specifying the number of elements to take from the start of `self`.

##### Returns

A lazy `Sequence` containing the first number of elements of `self`.

#### `take(last:)`

Takes the last number of elements from `self`. Should only be used with finite `Sequence`s.

##### Declaration

```swift
func take (last numberOfElements: Int) -> LazyTakeLastSequence<Self>
```

##### Example

```swift
let results = [1, 2, 3, 4, 5].take(last: 3)
let expectedResults = [3, 4, 5]
```

##### Parameters

- `numberOfElements` An `Int` specifying the number of elements to take from the end of `self`.

##### Returns

A lazy `Sequence` containing the last number of elements of `self`.
