# SequenceExtensions

![][language-badge] [![][license-badge]][license]

_SequenceExtensions_ is a library that adds various extensions to the [`LazySequenceProtocol`][lazysequenceprotocol] and [`Sequence`][sequence] protocols. It only adds extensions for operations which have no implementation in the standard library, should integrate well without adding any ambiguities and is well-documented and tested.

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
    - [Property Extensions on `LazySequenceProtocol`](#property-extensions-on-lazysequenceprotocol)
        - [`cycle`](#cycle)
    - [Method Extensions on `LazySequenceProtocol`](#method-extensions-on-lazysequenceprotocol)
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

Creates a lazily evaluated `Sequence` that appends the right-hand `Sequence` to the left-hand `Sequence`.

##### Attention

- If the left-hand `Sequence` is not finite, the result is the left-hand `Sequence`.
- Returns a lazy `Sequence`.

##### Example

```swift
print(Array([1, 2] ++ [3, 4]))
// [1, 2, 3, 4]
```

##### Declaration

```swift
infix operator ++

func ++ <T: Sequence> (_ lhs: T, _ rhs: T) -> LazyAppendSequence<T>
```

##### Parameters

- `lhs` The left-hand `Sequence`.
- `rhs` The right-hand `Sequence`.

##### Returns

A lazily evaluated `Sequence` containing the elements from the right-hand `Sequence` appended to the left-hand `Sequence`.

### Free Functions

#### `convolution(` `_:_:` `_:_:_:` `_:_:_:_:` `_:_:_:_:_:` `_:_:_:_:_:_:` `)`

Creates a [convolution][convolution] from two or more (up to six) `Sequence`s using lazy evaluation. `convolution(_:_:)` is similar to `zip(_:_:)`, but returns a lazily evaluated `Sequence`.

##### Attention

- If the `Sequence`s are of different lengths, the resulting `Sequence` is the same length as the shortest `Sequence`.
- Returns a lazy `Sequence`.

##### Examples

```swift
print(Array(convolution([1, 2], [3, 4])))
// [(1, 3), (2, 4)]
```

```swift
print(Array(convolution([1, 2], [3, 4], [5, 6])))
// [(1, 3, 5), (2, 4, 6)]
```

```swift
print(Array(convolution([1, 2], [3, 4], [5, 6], [7, 8])))
// [(1, 3, 5, 7), (2, 4, 6, 8)]
```

```swift
print(Array(convolution([1, 2], [3, 4], [5, 6], [7, 8], [9, 10])))
// [(1, 3, 5, 7, 9), (2, 4, 6, 8, 10)]
```

```swift
print(Array(convolution([1, 2], [3, 4], [5, 6], [7, 8], [9, 10], [11, 12])))
// [(1, 3, 5, 7, 9, 11), (2, 4, 6, 8, 10, 12)]
```

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

##### Parameters

- `sequence1` The first `Sequence`.
- `sequence2` The second `Sequence`.
- `sequence3` The third `Sequence` (≥ arity 3).
- `sequence4` The fourth `Sequence` (≥ arity 4).
- `sequence5` The fifth `Sequence` (≥ arity 5).
- `sequence6` The sixth `Sequence` (= arity 6).

##### Returns

A convolution as a lazily evaluated `Sequence` of n-tuples.

#### `product(` `_:_:` `_:_:_:` `_:_:_:_:` `_:_:_:_:_:` `_:_:_:_:_:_:` `)`

Creates a [Cartesian product][cartesian-product] from two or more (up to six) `Sequence`s using lazy evaluation.

##### Attention

Returns a lazy `Sequence`.

##### Examples

```swift
print(Array(product([1, 2], [3, 4])))
// [(1, 3), (1, 4), (2, 3), (2, 4)]
```

```swift
print(Array(product([1, 2], [3, 4], [5, 6]).take(4)))
// [(1, 3, 5), (1, 3, 6), (1, 4, 5), (1, 4, 6)]
```

```swift
print(Array(product([1, 2], [3, 4], [5, 6], [7, 8]).take(4)))
// [(1, 3, 5, 7), (1, 3, 5, 8), (1, 3, 6, 7), (1, 3, 6, 8)]
```

```swift
print(Array(product([1, 2], [3, 4], [5, 6], [7, 8], [9, 10]).take(4)))
// [(1, 3, 5, 7, 9), (1, 3, 5, 7, 10), (1, 3, 5, 8, 9), (1, 3, 5, 8, 10)]
```

```swift
print(Array(product([1, 2], [3, 4], [5, 6], [7, 8], [9, 10], [11, 12]).take(4)))
// [(1, 3, 5, 7, 9, 11), (1, 3, 5, 7, 9, 12), (1, 3, 5, 7, 10, 11), (1, 3, 5, 7, 10, 12)]
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
- `sequence3` The third `Sequence` (≥ arity 3).
- `sequence4` The fourth `Sequence` (≥ arity 4).
- `sequence5` The fifth `Sequence` (≥ arity 5).
- `sequence6` The sixth `Sequence` (= arity 6).

##### Returns

A product as a lazily evaluated `Sequence` of n-tuples.

### Property Extensions on `LazySequenceProtocol`

#### `cycle`

Creates a lazily evaluated `Sequence` that infinitely repeats the elements of `self`.

##### Example

```swift
print(Array([1, 2, 3].lazy.cycle.take(10)))
// [1, 2, 3, 1, 2, 3, 1, 2, 3, 1]
```

##### Declaration

```swift
var cycle: LazyCycleSequence<Self>
```

### Method Extensions on `LazySequenceProtocol`

#### `drop(first:)`

Creates a lazily evaluated `Sequence` containing all but the first number of elements of `self`.

##### Attention

If the number of elements to drop exceeds the number of elements in `self`, the result is an empty `Sequence`.

##### Precondition

`numberOfElements >= 0`

##### Example

```swift
print(Array([1, 2, 3, 4, 5].lazy.drop(first: 3)))
// [4, 5]
```

##### Declaration

```swift
func drop (first numberOfElements: Int) -> LazyDropFirstSequence<Self>
```

##### Parameters

- `numberOfElements` Specifies the first number of elements to drop from `self`.

##### Returns

A lazily evaluated `Sequence` containing all but the first number of elements of `self`.

#### `drop(last:)`

Creates a lazily evaluated `Sequence` containing all but the last number of elements of `self`.

##### Attention

If the number of elements to drop exceeds the number of elements in `self`, the result is an empty `Sequence`.

##### Precondition

`numberOfElements >= 0`

##### Example

```swift
print(Array([1, 2, 3, 4, 5].lazy.drop(last: 3)))
// [1, 2]
```

##### Declaration

```swift
func drop (last numberOfElements: Int) -> LazyDropLastSequence<Self>
```

##### Parameters

- `numberOfElements` Specifies the last number of elements to drop from `self`.

##### Returns

A lazily evaluated `Sequence` containing all but the last number of elements of `self`.

#### `take(first:)`

Creates a lazily evaluated `Sequence` containing the first number of elements of `self`. Is similar to `prefix(_ maxLength:)`, but `take(first:)` will guarantee to return a lazy `Sequence` when operating on a lazy `Sequence`.

##### Example

```swift
print(Array([1, 2, 3, 4, 5].lazy.take(first: 3)))
// [1, 2, 3]
```

##### Precondition

`numberOfElements >= 0`

##### Declaration

```swift
func take (first numberOfElements: Int) -> LazyTakeFirstSequence<Self>
```

##### Parameters

- `numberOfElements` Specifies the number of elements to take from the start of `self`.

##### Returns

A lazily evaluated `Sequence` that takes the number of elements from the start of `self`.

#### `take(last:)`

Creates a lazily evaluated `Sequence` containing the last number of elements of `self`.

##### Example

```swift
print(Array([1, 2, 3, 4, 5].lazy.take(last: 3)))
// [3, 4, 5]
```

##### Precondition

`numberOfElements >= 0`

##### Declaration

```swift
func take (last numberOfElements: Int) -> LazyTakeLastSequence<Self>
```

##### Parameters

- `numberOfElements` Specifies the number of elements to take from the end of `self`.

##### Returns

A lazily evaluated `Sequence` that takes the number of elements from the end of `self`.

<!-- Images -->
[language-badge]: https://img.shields.io/badge/Language-Swift%204-F04C3E.svg
[license-badge]: https://img.shields.io/badge/License-MIT-lightgrey.svg

<!-- Links -->
[license]: https://github.com/dennisvennink/SequenceExtensions/blob/master/LICENSE.md
[lazysequenceprotocol]: https://developer.apple.com/documentation/swift/lazysequenceprotocol
[sequence]: https://developer.apple.com/documentation/swift/sequence
[convolution]: https://en.wikipedia.org/wiki/Convolution_(computer_science)
[cartesian-product]: https://en.wikipedia.org/wiki/Cartesian_product
