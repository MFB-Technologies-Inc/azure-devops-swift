// AZPipelineRoute.swift
// azure-devops-swift
//
// Copyright © 2023 MFB Technologies, Inc. All rights reserved.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import AZCore
import Foundation
import HTTPTypes

public enum AZPipelineRoute: Hashable, Sendable, AZRequest {
    case create(AZCreateRequest<AZNewPipeline>)
    case get(GetRequest)
    case list(ListRequest)

    public var urlPath: String {
        "pipelines"
    }

    public var queryItems: [String: String] {
        switch self {
        case let .create(createRequest):
            return createRequest.queryItems
        case let .get(getRequest):
            return getRequest.queryItems
        case let .list(listRequest):
            return listRequest.queryItems
        }
    }

    public var method: HTTPRequest.Method {
        switch self {
        case let .create(createRequest):
            return createRequest.method
        case let .get(getRequest):
            return getRequest.method
        case let .list(listRequest):
            return listRequest.method
        }
    }

    public func body(encoder: some JSONEncoder) throws -> Data? {
        switch self {
        case let .create(createRequest):
            return try createRequest.body(encoder: encoder)
        case let .get(getRequest):
            return try getRequest.body(encoder: encoder)
        case let .list(listRequest):
            return try listRequest.body(encoder: encoder)
        }
    }
}

extension AZPipelineRoute {
    public typealias DeleteRequest = GetRequest

    public struct GetRequest: Hashable, Sendable, AZVersionedRequest_7_0, AZGetRequest {
        public let pipelineId: AZPipeline.ID

        public var queryItems: [String: String] {
            [
                "api-version": apiVersion.rawValue,
                "pipelineId": pipelineId.rawValue.description,
            ]
        }

        public init(pipelineId: AZPipeline.ID) {
            self.pipelineId = pipelineId
        }
    }

    public struct ListRequest: Hashable, Sendable, AZVersionedRequest_7_0, AZGetRequest {
        public var top: Int
        public var continuationToken: String?

        public var queryItems: [String: String] {
            var items: [String: String] = [
                "api-version": apiVersion.rawValue,
                "$top": top.description,
            ]
            if let continuationToken {
                items["continuationToken"] = continuationToken
            }
            return items
        }

        public init(top: Int, continuationToken: String? = nil) {
            self.top = top
            self.continuationToken = continuationToken
        }
    }
}
