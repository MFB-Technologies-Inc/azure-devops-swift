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
        public var repositoryId: AZRepositoryId

        @inlinable
        public init(refName: String, matchKind: String, repositoryId: AZRepositoryId) {
            self.refName = refName
            self.matchKind = matchKind
            self.repositoryId = repositoryId
        }
    }

    @inlinable
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
    @inlinable
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

    /// `internal` coding key for policy configuration settings to use when decoding with `decodeWithConfiguration`
    ///
    /// Named so it doesn't collide with the synthesized `CodingKeys`
    enum _DecodingKeys: String, CodingKey {
        case settings
    }
}

/// Proxy for decoding without settings so the policy type can provide decoding configuration for settings
@usableFromInline
struct _AZPolicyConfiguration: Decodable {
    @usableFromInline
    let id: AZPolicyConfiguration.ID
    @usableFromInline
    let createdDate: String
    @usableFromInline
    let isBlocking: Bool
    @usableFromInline
    let isDeleted: Bool
    @usableFromInline
    let isEnabled: Bool
    @usableFromInline
    let isEnterpriseManaged: Bool
    @usableFromInline
    let revision: Int
    @usableFromInline
    let type: AZPolicyType
    @usableFromInline
    let url: URL
    @usableFromInline
    let _links: [String: AZReferenceLink]?
}
