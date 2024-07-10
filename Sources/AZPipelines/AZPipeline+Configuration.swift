// AZPipeline+Configuration.swift
// azure-devops-swift
//
// Copyright © 2023 MFB Technologies, Inc. All rights reserved.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

extension AZPipeline {
    public struct Configuration: Hashable, Sendable, Codable {
        public var type: ConfigurationType
        public var repository: ConfigurationRepository?
        public var path: String?

        @inlinable
        public init(type: ConfigurationType, repository: ConfigurationRepository? = nil, path: String? = nil) {
            self.type = type
            self.repository = repository
            self.path = path
        }

        public static let designerHyphenJson: Self = Configuration(type: .designerHyphenJson)
        public static let designerJson: Self = Configuration(type: .designerJson)
        public static let justInTime: Self = Configuration(type: .justInTime)
        public static let unknown: Self = Configuration(type: .unknown)
        @inlinable
        public static func yaml(path: String, repository: ConfigurationRepository, type _: ConfigurationType) -> Self {
            self.init(
                type: .yaml,
                repository: repository,
                path: path
            )
        }
    }

    public enum ConfigurationType: String, Hashable, Sendable, CaseIterable, Codable {
        case designerHyphenJson
        case designerJson
        case justInTime
        case unknown
        case yaml
    }

    public struct ConfigurationRepository: Hashable, Sendable, Codable {
        public let id: AZRepositoryId
        public let type: RepositoryType

        @inlinable
        public init(id: AZRepositoryId, type: RepositoryType) {
            self.id = id
            self.type = type
        }
    }

    public enum RepositoryType: String, Hashable, Sendable, Codable {
        case azureReposGit
    }
}
