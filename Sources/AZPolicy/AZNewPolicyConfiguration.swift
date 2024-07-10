// AZNewPolicyConfiguration.swift
// azure-devops-swift
//
// Copyright © 2023 MFB Technologies, Inc. All rights reserved.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import AZCore
import Tagged

/// Request body for creating a new policy
public struct AZNewPolicyConfiguration: Hashable, Sendable, Encodable {
    public var isBlocking: Bool
    public var isDeleted: Bool
    public var isEnabled: Bool
    public var isEnterpriseManaged: Bool
    public var settings: AZPolicyConfiguration.Settings
    public let type: AZResourceReference<AZPolicyType>

    @inlinable
    public init(
        isBlocking: Bool,
        isDeleted: Bool,
        isEnabled: Bool,
        isEnterpriseManaged: Bool,
        settings: AZPolicyConfiguration.Settings,
        type: AZResourceReference<AZPolicyType>
    ) {
        self.isBlocking = isBlocking
        self.isDeleted = isDeleted
        self.isEnabled = isEnabled
        self.isEnterpriseManaged = isEnterpriseManaged
        self.settings = settings
        self.type = type
    }
}

extension AZNewPolicyConfiguration: Decodable {
    @inlinable
    public init(from decoder: Decoder) throws {
        let proxy = try _AZNewPolicyConfiguration(from: decoder)
        try self.init(
            isBlocking: proxy.isBlocking,
            isDeleted: proxy.isDeleted,
            isEnabled: proxy.isEnabled,
            isEnterpriseManaged: proxy.isEnterpriseManaged,
            settings: AZPolicyConfiguration.Settings(from: decoder, configuration: .build),
            type: proxy.type
        )
    }
}

/// Proxy for decoding without settings so the policy type can provide decoding configuration for settings
@usableFromInline
struct _AZNewPolicyConfiguration: Decodable {
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
    let type: AZResourceReference<AZPolicyType>
}
