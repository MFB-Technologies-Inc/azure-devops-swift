// AZBranch.swift
// azure-devops-swift
//
// Copyright © 2023 MFB Technologies, Inc. All rights reserved.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

/// Phantom type for referencing a devops repository branch by path but initialized by name..
public struct AZBranch: CustomStringConvertible, ExpressibleByStringLiteral, ExpressibleByStringInterpolation, Hashable,
    Sendable, RawRepresentable
{
    /// The path prefix for all branches in a repository
    @usableFromInline
    static let prefix: StaticString = #"refs/heads/"#

    @inlinable
    public init(name: CustomStringConvertible) {
        let stringValue = name.description
        self.name = name.description
        if stringValue.starts(with: Self.prefix.description) {
            rawValue = stringValue
        } else {
            rawValue = Self.prefix.description + stringValue
        }
    }

    @inlinable
    public var description: String {
        rawValue
    }

    /// `refs/heads/{name}`
    public let rawValue: String

    /// The name of the branch without prefix
    public let name: String

    @inlinable
    public init(rawValue: String) {
        self.init(name: rawValue)
    }

    @inlinable
    public init(stringLiteral: String) {
        self.init(rawValue: stringLiteral)
    }

    @inlinable
    public init(stringInterpolation: DefaultStringInterpolation) {
        self.init(rawValue: stringInterpolation.description)
    }
}

extension AZBranch: Decodable {
    @inlinable
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        try self.init(rawValue: container.decode(String.self))
    }
}

extension AZBranch: Encodable {
    @inlinable
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
