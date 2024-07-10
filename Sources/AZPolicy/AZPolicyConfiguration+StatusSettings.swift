// AZPolicyConfiguration+StatusSettings.swift
// azure-devops-swift
//
// Copyright © 2023 MFB Technologies, Inc. All rights reserved.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

extension AZPolicyConfiguration {
    public struct StatusSettings: Hashable, Sendable, Codable {
        public var statusGenre: String
        public var statusName: String
        /// Identity that can post this status. `nil` indicates any identity can post this status
        public var authorId: String?
        /// Reset status whenever there are changes to the source code
        public var invalidateOnSourceUpdate: Bool
        /// Display name for the status. `nil` uses an Azure-selected default
        public var defaultDisplayName: String?
        /// Determines when the policy is applied
        public var policyApplicability: PolicyApplicability?
        /// If a path filter is set, the policy will only apply when files which match the filter are changed. Leaving
        /// this field
        /// undefined means that the policy will always apply. You can specify absolute paths (path must start either by
        /// "/"
        /// or a wildcard) and wildcards.
        /// Example: `/WebApp/Models/Data.cs, /WebApp/*, or *.cs`
        ///
        /// You can specify multiple paths using ";" as a separator.
        /// Example: `/WebApp/Models/Data.cs;/ClientApp/Models/Data.cs`
        ///
        /// Paths prefixed with "!" are excluded if they would otherwise be included.
        /// Example: `/WebApp/*;!/WebApp/Tests/*`
        ///
        /// Order is significant. Filters are applied left to right.
        public var filenamePatterns: [String]?
        public var scope: [Scope]

        @inlinable
        public init(
            statusGenre: String,
            statusName: String,
            authorId: String? = nil,
            invalidateOnSourceUpdate: Bool,
            defaultDisplayName: String? = nil,
            policyApplicability: PolicyApplicability? = nil,
            filenamePatterns: [String]? = nil,
            scope: [Scope]
        ) {
            self.statusGenre = statusGenre
            self.statusName = statusName
            self.authorId = authorId
            self.invalidateOnSourceUpdate = invalidateOnSourceUpdate
            self.defaultDisplayName = defaultDisplayName
            self.policyApplicability = policyApplicability
            self.filenamePatterns = filenamePatterns
            self.scope = scope
        }

        @usableFromInline
        static func decodeWithConfiguration(decoder: some Decoder) throws -> Self {
            let configurationContainer = try decoder.container(keyedBy: AZPolicyConfiguration._DecodingKeys.self)
            return try configurationContainer.decode(Self.self, forKey: .settings)
        }
    }
}

extension AZPolicyConfiguration.StatusSettings {
    public enum PolicyApplicability: Hashable, Sendable {
        /// Apply unless `Not Applicable` status is posted to the pull request.
        case applyByDefault
        /// The policy is applied only after a status is posted to the pull request.
        case conditional
    }
}

extension AZPolicyConfiguration.StatusSettings.PolicyApplicability: Decodable {
    @inlinable
    public init(from decoder: any Decoder) throws {
        let _rawValue = try Int?(from: decoder)
        switch _rawValue {
        case .none:
            self = .applyByDefault
        case .some(1):
            self = .conditional
        case let .some(rawValue):
            throw DecodingError.dataCorrupted(.init(
                codingPath: decoder.codingPath,
                debugDescription: "Invalid integer value of \(rawValue.description)."
            ))
        }
    }
}

extension AZPolicyConfiguration.StatusSettings.PolicyApplicability: Encodable {
    @inlinable
    public func encode(to encoder: any Encoder) throws {
        switch self {
        case .applyByDefault:
            try Int?.none?.encode(to: encoder)
        case .conditional:
            try 1.encode(to: encoder)
        }
    }
}
