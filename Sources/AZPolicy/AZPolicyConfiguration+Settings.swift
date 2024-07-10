// AZPolicyConfiguration+Settings.swift
// azure-devops-swift
//
// Copyright © 2023 MFB Technologies, Inc. All rights reserved.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import AZCore
import Foundation
import Tagged

extension AZPolicyConfiguration {
    public enum Settings: Hashable, Sendable {
        case build(BuildSettings)
        case requiredReviewers(RequiredReviewersSettings)
        case status(StatusSettings)
    }
}

extension AZPolicyConfiguration.Settings: Encodable {
    @inlinable
    public func encode(to encoder: Encoder) throws {
        switch self {
        case let .build(buildSettings):
            try buildSettings.encode(to: encoder)
        case let .requiredReviewers(requiredReviewerSettings):
            try requiredReviewerSettings.encode(to: encoder)
        case let .status(statusSettings):
            try statusSettings.encode(to: encoder)
        }
    }
}

extension AZPolicyConfiguration.Settings: DecodableWithConfiguration {
    @inlinable
    public init(from decoder: Decoder, configuration: AZPolicyType.DisplayName) throws {
        switch configuration {
        case .build:
            self = try .build(AZPolicyConfiguration.BuildSettings.decodeWithConfiguration(decoder: decoder))
        case .requiredReviewers:
            self = try .requiredReviewers(
                AZPolicyConfiguration.RequiredReviewersSettings
                    .decodeWithConfiguration(decoder: decoder)
            )
        default:
            throw DecodingError.dataCorrupted(DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unsupported policy type '\(configuration.rawValue)'"
            ))
        }
    }
}
