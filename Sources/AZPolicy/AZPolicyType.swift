// AZPolicyType.swift
// azure-devops-swift
//
// Copyright © 2023 MFB Technologies, Inc. All rights reserved.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import AZCore
import Foundation
import Tagged

public struct AZPolicyType: Hashable, Sendable, Identifiable, Codable {
    public let id: ID
    public let displayName: DisplayName
    public let url: URL
    public let description: String?
    public let _links: [String: AZReferenceLink]?

    public init(
        id: ID,
        displayName: DisplayName,
        url: URL,
        description: String? = nil,
        _links: [String: AZReferenceLink]? = nil
    ) {
        self.id = id
        self.displayName = displayName
        self.url = url
        self.description = description
        self._links = _links
    }

    public enum _IDTag {}
    public typealias ID = Tagged<_IDTag, String>

    public enum _DisplayNameTag {}
    public typealias DisplayName = Tagged<_DisplayNameTag, String>
}

extension AZPolicyType.DisplayName {
    public static let build: Self = "Build"
    public static let requiredReviewers: Self = "Required reviewers"
}
