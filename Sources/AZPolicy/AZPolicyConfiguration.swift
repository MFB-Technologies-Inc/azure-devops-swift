// AZPolicyConfiguration.swift
// azure-devops-swift
//
// Copyright © 2023 MFB Technologies, Inc. All rights reserved.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import AZCore
import Foundation
import Tagged

/// Resource for a policy in Azure Devops
public struct AZPolicyConfiguration: Hashable, Sendable, Identifiable, Encodable {
    public let id: ID
    public let createdDate: String
    public var isBlocking: Bool
    public var isDeleted: Bool
    public var isEnabled: Bool
    public var isEnterpriseManaged: Bool
    public var revision: Int
    public var settings: Settings
    public let type: AZPolicyType
    public let url: URL
    public let _links: [String: AZReferenceLink]?

    public struct Scope: Hashable, Sendable, Codable {
        public var refName: String
        public var matchKind: String
        public var repositoryId: RepositoryId

        public init(refName: String, matchKind: String, repositoryId: RepositoryId) {
            self.refName = refName
            self.matchKind = matchKind
            self.repositoryId = repositoryId
        }
    }

    public enum _RepositoryIdTag {}
    public typealias RepositoryId = Tagged<_RepositoryIdTag, String>

    public init(
        id: ID,
        createdDate: String,
        isBlocking: Bool,
        isDeleted: Bool,
        isEnabled: Bool,
        isEnterpriseManaged: Bool,
        revision: Int,
        settings: Settings,
        type: AZPolicyType,
        url: URL,
        _links: [String: AZReferenceLink]? = nil
    ) {
        self.id = id
        self.createdDate = createdDate
        self.isBlocking = isBlocking
        self.isDeleted = isDeleted
        self.isEnabled = isEnabled
        self.isEnterpriseManaged = isEnterpriseManaged
        self.revision = revision
        self.settings = settings
        self.type = type
        self.url = url
        self._links = _links
    }

    public enum _IDTag {}
    public typealias ID = Tagged<_IDTag, Int>
}

// MARK: Decodable

extension AZPolicyConfiguration: Decodable {
    public init(from decoder: Decoder) throws {
        let proxy = try _AZPolicyConfiguration(from: decoder)
        try self.init(
            id: proxy.id,
            createdDate: proxy.createdDate,
            isBlocking: proxy.isBlocking,
            isDeleted: proxy.isDeleted,
            isEnabled: proxy.isEnabled,
            isEnterpriseManaged: proxy.isEnterpriseManaged,
            revision: proxy.revision,
            settings: AZPolicyConfiguration.Settings(from: decoder, configuration: proxy.type.displayName),
            type: proxy.type,
            url: proxy.url,
            _links: proxy._links
        )
    }
}

/// Proxy for decoding without settings so the policy type can provide decoding configuration for settings
private struct _AZPolicyConfiguration: Decodable {
    let id: AZPolicyConfiguration.ID
    let createdDate: String
    let isBlocking: Bool
    let isDeleted: Bool
    let isEnabled: Bool
    let isEnterpriseManaged: Bool
    let revision: Int
    let type: AZPolicyType
    let url: URL
    let _links: [String: AZReferenceLink]?
}

// MARK: Settings

extension AZPolicyConfiguration {
    public enum Settings: Hashable, Sendable {
        case build(BuildSettings)
        case requiredReviewers(RequiredReviewersSettings)
    }

    public struct BuildSettings: Hashable, Sendable, Codable {
        public let buildDefinitionId: RepositoryId
        public var queueOnSourceUpdateOnly: Bool
        public var manualQueueOnly: Bool
        public var displayName: String
        public var validDuration: Double
        public var scope: [Scope]
        public var filenamePatterns: [String]?

        public init(
            buildDefinitionId: RepositoryId,
            queueOnSourceUpdateOnly: Bool,
            manualQueueOnly: Bool,
            displayName: String,
            validDuration: Double,
            scope: [Scope],
            filenamePatterns: [String]?
        ) {
            self.buildDefinitionId = buildDefinitionId
            self.queueOnSourceUpdateOnly = queueOnSourceUpdateOnly
            self.manualQueueOnly = manualQueueOnly
            self.displayName = displayName
            self.validDuration = validDuration
            self.scope = scope
            self.filenamePatterns = filenamePatterns
        }

        fileprivate static func decodeWithConfiguration(decoder: some Decoder) throws -> Self {
            let configurationContainer = try decoder.container(keyedBy: AZPolicyConfiguration.CodingKeys.self)
            return try configurationContainer.decode(Self.self, forKey: .settings)
        }
    }

    public struct RequiredReviewersSettings: Hashable, Sendable, Codable {
        public let requiredReviewerIds: [String]
        public var filenamePatters: [String]
        public var addedFilesOnly: Bool
        public var message: String?
        public var scope: [Scope]

        public init(
            requiredReviewerIds: [String],
            filenamePatters: [String],
            addedFilesOnly: Bool,
            message: String? = nil,
            scope: [Scope]
        ) {
            self.requiredReviewerIds = requiredReviewerIds
            self.filenamePatters = filenamePatters
            self.addedFilesOnly = addedFilesOnly
            self.message = message
            self.scope = scope
        }

        fileprivate static func decodeWithConfiguration(decoder: some Decoder) throws -> Self {
            let configurationContainer = try decoder.container(keyedBy: AZPolicyConfiguration.CodingKeys.self)
            return try configurationContainer.decode(Self.self, forKey: .settings)
        }
    }
}

extension AZPolicyConfiguration.Settings: Encodable {
    public func encode(to encoder: Encoder) throws {
        switch self {
        case let .build(buildSettings):
            try buildSettings.encode(to: encoder)
        case let .requiredReviewers(requiredReviewerSettings):
            try requiredReviewerSettings.encode(to: encoder)
        }
    }
}

extension AZPolicyConfiguration.Settings: DecodableWithConfiguration {
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
