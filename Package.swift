// swift-tools-version:4.0

import PackageDescription

let package = Package(
  name: "SequenceExtensions",
  products: [.library(name: "SequenceExtensions", targets: ["SequenceExtensions"])],
  dependencies: [],
  targets: [
    .target(name: "SequenceExtensions", dependencies: []),
    .testTarget(name: "SequenceExtensionsTests", dependencies: ["SequenceExtensions"])
  ]
)
