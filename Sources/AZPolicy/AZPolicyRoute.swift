// AZPolicyRoute.swift
// azure-devops-swift
//
// Copyright © 2023 MFB Technologies, Inc. All rights reserved.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import AZCore
import Foundation
import HTTPTypes

/// REST API routes for policies
public enum AZPolicyRoute: Hashable, Sendable, AZRequest {
    case configurations(ConfigurationsRoute)
    case typeRoute(TypeRoute)

    @inlinable
    public var urlPath: String {
        let subPath: String
        switch self {
        case let .configurations(configurationsRoute):
            subPath = configurationsRoute.urlPath
        case let .typeRoute(typeRoute):
            subPath = typeRoute.urlPath
        }
        return "policy/\(subPath)"
    }

    @inlinable
    public var queryItems: [String: String] {
        switch self {
        case let .configurations(configurationsRoute):
            return configurationsRoute.queryItems
        case let .typeRoute(typeRoute):
            return typeRoute.queryItems
        }
    }

    @inlinable
    public var method: HTTPRequest.Method {
        switch self {
        case let .configurations(configurationsRoute):
            return configurationsRoute.method
        case let .typeRoute(typeRoute):
            return typeRoute.method
        }
    }

    @inlinable
    public func body(encoder: some JSONEncoder) throws -> Data? {
        switch self {
        case let .configurations(configurationsRoute):
            return try configurationsRoute.body(encoder: encoder)
        case let .typeRoute(typeRoute):
            return try typeRoute.body(encoder: encoder)
        }
    }
}
