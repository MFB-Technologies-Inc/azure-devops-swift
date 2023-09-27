// AzureDevopsRoute.swift
// azure-devops-swift
//
// Copyright © 2023 MFB Technologies, Inc. All rights reserved.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import AZCore
import AZPipelines
import AZPolicy
import Foundation
import HTTPTypes

public enum AzureDevopsRoute: Hashable, Sendable, AZRequest {
    case pipeline(AZPipelineRoute)
    case policy(AZPolicyRoute)

    public var urlPath: String {
        switch self {
        case let .pipeline(pipelineRoute):
            return pipelineRoute.urlPath
        case let .policy(policyRoute):
            return policyRoute.urlPath
        }
    }

    public var queryItems: [String: String] {
        switch self {
        case let .pipeline(pipelineRoute):
            return pipelineRoute.queryItems
        case let .policy(policyRoute):
            return policyRoute.queryItems
        }
    }

    public var method: HTTPRequest.Method {
        switch self {
        case let .pipeline(pipelineRoute):
            return pipelineRoute.method
        case let .policy(policyRoute):
            return policyRoute.method
        }
    }

    public func body(encoder: some JSONEncoder) throws -> Data? {
        switch self {
        case let .pipeline(pipelineRoute):
            return try pipelineRoute.body(encoder: encoder)
        case let .policy(policyRoute):
            return try policyRoute.body(encoder: encoder)
        }
    }
}
