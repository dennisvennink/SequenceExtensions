# SequenceExtensions

![Requires Swift > 4](https://img.shields.io/badge/Language-Swift%204-F04C3E.svg) ![Licensed under the MIT license](https://img.shields.io/badge/License-MIT-lightgrey.svg)

_SequenceExtensions_ is a library that adds various `Sequence`-related operations.

## Table Of Contents

- [Installation](#installation)
    - [Swift Package Manager](#swift-package-manager)
- [Contributing](#contributing)
- [Testing](#testing)
- [API](#api)
    - [Operator Overloads](#operator-overloads)
        - [`!=(_:_:)`](#__)
        - [`==(_:_:)`](#__)
    - [Free Functions](#free-functions)
        - [`product(` `_:_:` `_:_:_:` `_:_:_:_:` `_:_:_:_:_:` `_:_:_:_:_:_:` `)`](#product-__-___-____-_____-______-)
        - [`zip(` `_:_:_:` `_:_:_:_:` `_:_:_:_:_:` `_:_:_:_:_:_:` `)`](#zip-___-____-_____-______-)
    - [Property Extensions on `Sequence`](#property-extensions-on-sequence)
        - [`duplicates`](#duplicates)
        - [`occurrences`](#occurrences)
    - [Method Extensions on `Sequence`](#method-extensions-on-sequence)
        - [`occurrences(of:)`](#occurrencesof)

## Installation

### Swift Package Manager

To install this package, add it as a dependency to your project's manifest file (`Package.swift`), e.g., a package named `"Example"` whose main product is a library with no dependencies other than SequenceExtensions would be defined as such:

```swift
// swift-tools-version:4.0
import PackageDescription

let package = Package(
  name: "Example",
  products: [
    .library(name: "Example", targets: ["Example"])
  ],
  dependencies: [
    .package(url: "https://github.com/dennisvennink/SequenceExtensions.git", from: "3.0.1")
  ],
  targets: [
    .target(name: "Example", dependencies: ["SequenceExtensions"]),
    .testTarget(name: "ExampleTests", dependencies: ["Example"])
  ]
)
```

Then, `import` it into your project:

```swift
import SequenceExtensions
```

## Contributing

To contribute, think of a missing feature or issue to work on, then fork the project and create your feature branch:

```shell
git checkout -b my-new-feature
```

When you're done implementing your feature, commit your changes:

```shell
git commit -am "Add some new feature"
```

Then push to the feature branch:

```shell
git push origin my-new-feature
```

Finally, submit a pull request!

## Testing

All tests are written in [_XCTest_](https://developer.apple.com/documentation/xctest). To perform them, run:

```shell
swift test
```

## API

### Operator Overloads

#### `==(_:_:)`

##### Declarations

```swift
public func == <Sequence1: Sequence, Sequence2: Sequence, Equatable1: Equatable, Equatable2: Equatable> (lhs: Sequence1, rhs: Sequence2) -> Bool where Sequence1.Element == (Equatable1, Equatable2), Sequence2.Element == (Equatable1, Equatable2)
```

```swift
public func == <Sequence1: Sequence, Sequence2: Sequence, Equatable1: Equatable, Equatable2: Equatable, Equatable3: Equatable> (lhs: Sequence1, rhs: Sequence2) -> Bool where Sequence1.Element == (Equatable1, Equatable2, Equatable3), Sequence2.Element == (Equatable1, Equatable2, Equatable3)
```

```swift
public func == <Sequence1: Sequence, Sequence2: Sequence, Equatable1: Equatable, Equatable2: Equatable, Equatable3: Equatable, Equatable4: Equatable> (lhs: Sequence1, rhs: Sequence2) -> Bool where Sequence1.Element == (Equatable1, Equatable2, Equatable3, Equatable4), Sequence2.Element == (Equatable1, Equatable2, Equatable3, Equatable4)
```

```swift
public func == <Sequence1: Sequence, Sequence2: Sequence, Equatable1: Equatable, Equatable2: Equatable, Equatable3: Equatable, Equatable4: Equatable, Equatable5: Equatable> (lhs: Sequence1, rhs: Sequence2) -> Bool where Sequence1.Element == (Equatable1, Equatable2, Equatable3, Equatable4, Equatable5), Sequence2.Element == (Equatable1, Equatable2, Equatable3, Equatable4, Equatable5)
```

```swift
public func == <Sequence1: Sequence, Sequence2: Sequence, Equatable1: Equatable, Equatable2: Equatable, Equatable3: Equatable, Equatable4: Equatable, Equatable5: Equatable, Equatable6: Equatable> (lhs: Sequence1, rhs: Sequence2) -> Bool where Sequence1.Element == (Equatable1, Equatable2, Equatable3, Equatable4, Equatable5, Equatable6), Sequence2.Element == (Equatable1, Equatable2, Equatable3, Equatable4, Equatable5, Equatable6)
```

##### Description

Compares whether the left-hand `Sequence` of n-tuples is equal to the right-hand `Sequence` of n-tuples.

```swift
print([(0, 1)] == [(0, 1)])
// true
```

```swift
print([(0, 1, 2)] == [(0, 1, 2)])
// true
```

```swift
print([(0, 1, 2, 3)] == [(0, 1, 2, 3)])
// true
```

```swift
print([(0, 1, 2, 3, 4)] == [(0, 1, 2, 3, 4)])
// true
```

```swift
print([(0, 1, 2, 3, 4, 5)] == [(0, 1, 2, 3, 4, 5)])
// true
```

##### Parameters

- `lhs`: The left-hand `Sequence` of n-tuples.
- `rhs`: The right-hand `Sequence` of n-tuples.

##### Returns

A `Bool`ean value indicating whether the left-hand `Sequence` of n-tuples is equal to the right-hand `Sequence` of n-tuples.

#### `!=(_:_:)`

##### Declarations

```swift
public func != <Sequence1: Sequence, Sequence2: Sequence, Equatable1: Equatable, Equatable2: Equatable> (lhs: Sequence1, rhs: Sequence2) -> Bool where Sequence1.Element == (Equatable1, Equatable2), Sequence2.Element == (Equatable1, Equatable2)
```

```swift
public func != <Sequence1: Sequence, Sequence2: Sequence, Equatable1: Equatable, Equatable2: Equatable, Equatable3: Equatable> (lhs: Sequence1, rhs: Sequence2) -> Bool where Sequence1.Element == (Equatable1, Equatable2, Equatable3), Sequence2.Element == (Equatable1, Equatable2, Equatable3)
```

```swift
public func != <Sequence1: Sequence, Sequence2: Sequence, Equatable1: Equatable, Equatable2: Equatable, Equatable3: Equatable, Equatable4: Equatable> (lhs: Sequence1, rhs: Sequence2) -> Bool where Sequence1.Element == (Equatable1, Equatable2, Equatable3, Equatable4), Sequence2.Element == (Equatable1, Equatable2, Equatable3, Equatable4)
```

```swift
public func != <Sequence1: Sequence, Sequence2: Sequence, Equatable1: Equatable, Equatable2: Equatable, Equatable3: Equatable, Equatable4: Equatable, Equatable5: Equatable> (lhs: Sequence1, rhs: Sequence2) -> Bool where Sequence1.Element == (Equatable1, Equatable2, Equatable3, Equatable4, Equatable5), Sequence2.Element == (Equatable1, Equatable2, Equatable3, Equatable4, Equatable5)
```

```swift
public func != <Sequence1: Sequence, Sequence2: Sequence, Equatable1: Equatable, Equatable2: Equatable, Equatable3: Equatable, Equatable4: Equatable, Equatable5: Equatable, Equatable6: Equatable> (lhs: Sequence1, rhs: Sequence2) -> Bool where Sequence1.Element == (Equatable1, Equatable2, Equatable3, Equatable4, Equatable5, Equatable6), Sequence2.Element == (Equatable1, Equatable2, Equatable3, Equatable4, Equatable5, Equatable6)
```

##### Description

Compares whether the left-hand `Sequence` of n-tuples is not equal to the right-hand `Sequence` of n-tuples.

```swift
print([(0, 1)] != [(0, 2)])
// true
```

```swift
print([(0, 1, 2)] != [(0, 1, 3)])
// true
```

```swift
print([(0, 1, 2, 3)] != [(0, 1, 2, 4)])
// true
```

```swift
print([(0, 1, 2, 3, 4)] != [(0, 1, 2, 3, 5)])
// true
```

```swift
print([(0, 1, 2, 3, 4, 5)] != [(0, 1, 2, 3, 4, 6)])
// true
```

##### Parameters

- `lhs`: The left-hand `Sequence` of n-tuples.
- `rhs`: The right-hand `Sequence` of n-tuples.

##### Returns

A `Bool`ean value indicating whether the left-hand `Sequence` of n-tuples is not equal to the right-hand `Sequence` of n-tuples.

### Free Functions

#### `product(` `_:_:` `_:_:_:` `_:_:_:_:` `_:_:_:_:_:` `_:_:_:_:_:_:` `)`

##### Declarations

```swift
public func product <Sequence1: Sequence, Sequence2: Sequence> (_ sequence1: Sequence1, _ sequence2: Sequence2) -> AnySequence<(Sequence1.Element, Sequence2.Element)>
```

```swift
public func product <Sequence1: Sequence, Sequence2: Sequence, Sequence3: Sequence> (_ sequence1: Sequence1, _ sequence2: Sequence2, _ sequence3: Sequence3) -> AnySequence<(Sequence1.Element, Sequence2.Element, Sequence3.Element)>
```

```swift
public func product <Sequence1: Sequence, Sequence2: Sequence, Sequence3: Sequence, Sequence4: Sequence> (_ sequence1: Sequence1, _ sequence2: Sequence2, _ sequence3: Sequence3, _ sequence4: Sequence4) -> AnySequence<(Sequence1.Element, Sequence2.Element, Sequence3.Element, Sequence4.Element)>
```

```swift
public func product <Sequence1: Sequence, Sequence2: Sequence, Sequence3: Sequence, Sequence4: Sequence, Sequence5: Sequence> (_ sequence1: Sequence1, _ sequence2: Sequence2, _ sequence3: Sequence3, _ sequence4: Sequence4, _ sequence5: Sequence5) -> AnySequence<(Sequence1.Element, Sequence2.Element, Sequence3.Element, Sequence4.Element, Sequence5.Element)>
```

```swift
public func product <Sequence1: Sequence, Sequence2: Sequence, Sequence3: Sequence, Sequence4: Sequence, Sequence5: Sequence, Sequence6: Sequence> (_ sequence1: Sequence1, _ sequence2: Sequence2, _ sequence3: Sequence3, _ sequence4: Sequence4, _ sequence5: Sequence5, _ sequence6: Sequence6) -> AnySequence<(Sequence1.Element, Sequence2.Element, Sequence3.Element, Sequence4.Element, Sequence5.Element, Sequence6.Element)>
```

##### Description

Creates the Cartesian product of two `Sequence`s as a `Sequence` of n-tuples.

```swift
print(Array(product([1, 2], [3, 4])))
// [(1, 3), (1, 4), (2, 3), (2, 4)]
```

```swift
print(Array(product([1, 2], [3, 4], [5, 6]).prefix(4)))
// [(1, 3, 5), (1, 3, 6), (1, 4, 5), (1, 4, 6)]
```

```swift
print(Array(product([1, 2], [3, 4], [5, 6], [7, 8]).prefix(4)))
// [(1, 3, 5, 7), (1, 3, 5, 8), (1, 3, 6, 7), (1, 3, 6, 8)]
```

```swift
print(Array(product([1, 2], [3, 4], [5, 6], [7, 8], [9, 10]).prefix(4)))
// [(1, 3, 5, 7, 9), (1, 3, 5, 7, 10), (1, 3, 5, 8, 9), (1, 3, 5, 8, 10)]
```

```swift
print(Array(product([1, 2], [3, 4], [5, 6], [7, 8], [9, 10], [11, 12]).prefix(4)))
// [(1, 3, 5, 7, 9, 11), (1, 3, 5, 7, 9, 12), (1, 3, 5, 7, 10, 11), (1, 3, 5, 7, 10, 12)]
```

##### Parameters

- `sequence1`: The first `Sequence`.
- `sequence2`: The second `Sequence`.
- (`sequence3`: The third `Sequence`.)
- (`sequence4`: The fourth `Sequence`.)
- (`sequence5`: The five `Sequence`.)
- (`sequence6`: The six `Sequence`.)

##### Returns

A Cartesian product as a `Sequence` of n-tuples.

#### `zip(` `_:_:_:` `_:_:_:_:` `_:_:_:_:_:` `_:_:_:_:_:_:` `)`

##### Declarations

```swift
public func zip <Sequence1: Sequence, Sequence2: Sequence, Sequence3: Sequence> (_ sequence1: Sequence1, _ sequence2: Sequence2, _ sequence3: Sequence3) -> AnySequence<(Sequence1.Element, Sequence2.Element, Sequence3.Element)>
```

```swift
public func zip <Sequence1: Sequence, Sequence2: Sequence, Sequence3: Sequence, Sequence4: Sequence> (_ sequence1: Sequence1, _ sequence2: Sequence2, _ sequence3: Sequence3, _ sequence4: Sequence4) -> AnySequence<(Sequence1.Element, Sequence2.Element, Sequence3.Element, Sequence4.Element)>
```

```swift
public func zip <Sequence1: Sequence, Sequence2: Sequence, Sequence3: Sequence, Sequence4: Sequence, Sequence5: Sequence> (_ sequence1: Sequence1, _ sequence2: Sequence2, _ sequence3: Sequence3, _ sequence4: Sequence4, _ sequence5: Sequence5) -> AnySequence<(Sequence1.Element, Sequence2.Element, Sequence3.Element, Sequence4.Element, Sequence5.Element)>
```

```swift
public func zip <Sequence1: Sequence, Sequence2: Sequence, Sequence3: Sequence, Sequence4: Sequence, Sequence5: Sequence, Sequence6: Sequence> (_ sequence1: Sequence1, _ sequence2: Sequence2, _ sequence3: Sequence3, _ sequence4: Sequence4, _ sequence5: Sequence5, _ sequence6: Sequence6) -> AnySequence<(Sequence1.Element, Sequence2.Element, Sequence3.Element, Sequence4.Element, Sequence5.Element, Sequence6.Element)>
```

##### Description

Creates the zip of three `Sequence`s as a `Sequence` of n-tuples.

```swift
print(Array(zip([1, 2], [3, 4])))
// [(1, 3), (2, 4)]
```

```swift
print(Array(zip([1, 2], [3, 4], [5, 6], [7, 8])))
// [(1, 3, 5, 7), (2, 4, 6, 8)]
```

```swift
print(Array(zip([1, 2], [3, 4], [5, 6], [7, 8], [9, 10])))
// [(1, 3, 5, 7, 9), (2, 4, 6, 8, 10)]
```

```swift
print(Array(zip([1, 2], [3, 4], [5, 6], [7, 8], [9, 10], [11, 12])))
// [(1, 3, 5, 7, 9, 11), (2, 4, 6, 8, 10, 12)]
```

##### Attention

If the `Sequence`s are of different lengths, the resulting `Sequence` is the same length as the shortest `Sequence`.

##### Parameters

- `sequence1`: The first `Sequence`.
- `sequence2`: The second `Sequence`.
- `sequence3`: The third `Sequence`.
- (`sequence4`: The fourth `Sequence`.)
- (`sequence5`: The five `Sequence`.)
- (`sequence6`: The six `Sequence`.)

##### Returns

A zip as a `Sequence` of n-tuples.

### Property Extensions on `Sequence`

#### `duplicates`

##### Declaration

```swift
var duplicates: [Element: [Int]] { get }
```

##### Description

Returns a `Dictionary` containing the duplicate elements in `self` as keys and the offsets of each duplicate element starting from zero as values.

```swift
print([0, 1, 1, 2, 2, 2, 3, 3, 3, 3].duplicates)
// [1: [2], 2: [4, 5], 3: [7, 8, 9]]
```

#### `occurrences`

##### Declaration

```swift
var occurrences: [Element: [Int]] { get }
```

##### Description

Returns a `Dictionary` containing the occurring elements in `self` as keys and the offsets of each occurring element starting from zero as values.

```swift
print([0, 1, 1, 2, 2, 2, 3, 3, 3, 3].occurrences)
// [0: [0], 1: [1, 2], 2: [3, 4, 5], 3: [6, 7, 8, 9]]
```

### Method Extensions on `Sequence`

#### `occurrences(of:)`

##### Declaration

```swift
func occurrences (of elements: [Element]) -> [Element: [Int]]
```

##### Description

Returns a `Dictionary` containing the occurring elements in `elements` as keys and the offset, starting from zero, of each occurring element as values.

```swift
print([0, 1, 1, 2, 2, 2, 3, 3, 3, 3].occurrences(of: [1, 3]))
// [1: [1, 2], 3: [6, 7, 8, 9]]
```

##### Parameters

- `elements`: The `Element`s to get the occurring elements of.

##### Returns

A `Dictionary` containing the occurring elements in `elements` as keys and the offset, starting from zero, of each occurring element as values.
