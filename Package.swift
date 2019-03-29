// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

var package = Package(
    name: "Turnstile",
    targets: [
        .target(
            name: "Turnstile",
            dependencies: ["TurnstileCrypto"]),
        .target(
            name: "TurnstileCrypto"),
        .target(
            name: "TurnstileWeb",
            dependencies: ["Turnstile"]),
        ]
)