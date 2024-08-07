// AZPolicyRoute+TypeRoute.swift
// azure-devops-swift
//
// Copyright © 2023 MFB Technologies, Inc. All rights reserved.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import AZCore
import Foundation
import HTTPTypes
import Tagged

extension AZPolicyRoute {
    public enum TypeRoute: Hashable, Sendable, AZRequest {
        case get(GetRequest)
        case list(ListRequest)

        @inlinable
        public var urlPath: String {
            "types"
        }

        @inlinable
        public var queryItems: [String: String] {
            switch self {
            case let .get(getRequest):
                return getRequest.queryItems
            case let .list(listRequest):
                return listRequest.queryItems
            }
        }

        @inlinable
        public var method: HTTPRequest.Method {
            switch self {
            case let .get(getRequest):
                return getRequest.method
            case let .list(listRequest):
                return listRequest.method
            }
        }

        @inlinable
        public func body(encoder: some JSONEncoder) throws -> Data? {
            switch self {
            case let .get(getRequest):
                return try getRequest.body(encoder: encoder)
            case let .list(listRequest):
                return try listRequest.body(encoder: encoder)
            }
        }
    }
}

extension AZPolicyRoute.TypeRoute {
    public struct GetRequest: Hashable, Sendable, AZVersionedRequest_7_0, AZGetRequest {
        public let configurationId: AZPolicyType.ID

        @inlinable
        public var queryItems: [String: String] {
            [
                "api-version": apiVersion.rawValue,
                "configurationId": configurationId.description,
            ]
        }

        @inlinable
        public init(configurationId: AZPolicyType.ID) {
            self.configurationId = configurationId
        }
    }

    public struct ListRequest: Hashable, Sendable, AZVersionedRequest_7_0, AZGetRequest {
        @inlinable
        public var queryItems: [String: String] {
            [
                "api-version": apiVersion.rawValue,
            ]
        }

        @inlinable
        public init() {
            // empty
        }
    }
}
