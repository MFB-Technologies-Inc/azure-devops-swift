// AZPolicyRoute+ConfigurationsRoute.swift
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
    public enum ConfigurationsRoute: Hashable, Sendable, AZRequest {
        case create(AZCreateRequest<AZNewPolicyConfiguration>)
        case delete(DeleteRequest)
        case get(GetRequest)
        case list(ListRequest)
        case update(UpdateRequest)

        @inlinable
        public var urlPath: String {
            "configurations"
        }

        @inlinable
        public var queryItems: [String: String] {
            switch self {
            case let .create(createRequest):
                return createRequest.queryItems
            case let .delete(deleteRequest):
                return deleteRequest.queryItems
            case let .get(getRequest):
                return getRequest.queryItems
            case let .list(listRequest):
                return listRequest.queryItems
            case let .update(updateRequest):
                return updateRequest.queryItems
            }
        }

        @inlinable
        public var method: HTTPRequest.Method {
            switch self {
            case let .create(createRequest):
                return createRequest.method
            case let .delete(deleteRequest):
                return deleteRequest.method
            case let .get(getRequest):
                return getRequest.method
            case let .list(listRequest):
                return listRequest.method
            case let .update(updateRequest):
                return updateRequest.method
            }
        }

        @inlinable
        public func body(encoder: some JSONEncoder) throws -> Data? {
            switch self {
            case let .create(createRequest):
                return try createRequest.body(encoder: encoder)
            case let .delete(deleteRequest):
                return try deleteRequest.body(encoder: encoder)
            case let .get(getRequest):
                return try getRequest.body(encoder: encoder)
            case let .list(listRequest):
                return try listRequest.body(encoder: encoder)
            case let .update(updateRequest):
                return try updateRequest.body(encoder: encoder)
            }
        }
    }
}

extension AZPolicyRoute.ConfigurationsRoute {
    public typealias DeleteRequest = GetRequest

    public struct GetRequest: Hashable, Sendable, AZVersionedRequest_7_0, AZGetRequest {
        public let configurationId: AZPolicyConfiguration.ID

        @inlinable
        public var queryItems: [String: String] {
            [
                "api-version": apiVersion.rawValue,
                "configurationId": configurationId.rawValue.description,
            ]
        }

        @inlinable
        public init(configurationId: AZPolicyConfiguration.ID) {
            self.configurationId = configurationId
        }
    }

    public struct ListRequest: Hashable, Sendable, AZVersionedRequest_7_0, AZGetRequest {
        public var top: Int
        public var continuationToken: String?
        public var policyType: AZPolicyType.ID?

        @inlinable
        public var queryItems: [String: String] {
            var items: [String: String] = [
                "api-version": apiVersion.rawValue,
                "$top": top.description,
            ]
            if let continuationToken {
                items["continuationToken"] = continuationToken
            }
            if let policyType {
                items["policyType"] = policyType.description
            }
            return items
        }

        @inlinable
        public init(top: Int, continuationToken: String? = nil, policyType: AZPolicyType.ID? = nil) {
            self.top = top
            self.continuationToken = continuationToken
            self.policyType = policyType
        }
    }

    public struct UpdateRequest: Hashable, Sendable, AZVersionedRequest_7_0, AZPutRequest {
        @inlinable
        public var configurationId: AZPolicyConfiguration.ID { body.id }
        public let body: AZPolicyConfiguration

        @inlinable
        public var queryItems: [String: String] {
            [
                "api-version": apiVersion.rawValue,
                "configurationId": configurationId.description,
            ]
        }

        @inlinable
        public func body(encoder: some JSONEncoder) throws -> Data? {
            try? encoder.encode(body)
        }

        @inlinable
        public init(body: AZPolicyConfiguration) {
            self.body = body
        }
    }
}
