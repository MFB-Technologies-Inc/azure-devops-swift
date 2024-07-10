// AZPolicyConfiguration+RequiredReviewerSettings.swift
// azure-devops-swift
//
// Copyright © 2023 MFB Technologies, Inc. All rights reserved.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

extension AZPolicyConfiguration {
    public struct RequiredReviewersSettings: Hashable, Sendable, Codable {
        public let requiredReviewerIds: [String]
        public var filenamePatters: [String]
        public var addedFilesOnly: Bool
        public var message: String?
        public var scope: [Scope]

        @inlinable
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

        @usableFromInline
        static func decodeWithConfiguration(decoder: some Decoder) throws -> Self {
            let configurationContainer = try decoder.container(keyedBy: AZPolicyConfiguration._DecodingKeys.self)
            return try configurationContainer.decode(Self.self, forKey: .settings)
        }
    }
}
