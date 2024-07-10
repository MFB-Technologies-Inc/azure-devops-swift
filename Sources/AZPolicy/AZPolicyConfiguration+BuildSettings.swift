// AZPolicyConfiguration+BuildSettings.swift
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
    public struct BuildSettings: Hashable, Sendable, Codable {
        public let buildDefinitionId: AZPipelineId
        public var queueOnSourceUpdateOnly: Bool
        public var manualQueueOnly: Bool
        public var displayName: String
        public var validDuration: Double
        public var scope: [Scope]
        public var filenamePatterns: [String]?

        @inlinable
        public init(
            buildDefinitionId: AZPipelineId,
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

        @usableFromInline
        static func decodeWithConfiguration(decoder: some Decoder) throws -> Self {
            let configurationContainer = try decoder.container(keyedBy: AZPolicyConfiguration._DecodingKeys.self)
            return try configurationContainer.decode(Self.self, forKey: .settings)
        }
    }
}
