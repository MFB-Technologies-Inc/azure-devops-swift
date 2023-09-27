// AZPipeline.swift
// azure-devops-swift
//
// Copyright © 2023 MFB Technologies, Inc. All rights reserved.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import AZCore
import Foundation
import Tagged

public struct AZPipeline: Identifiable, Hashable, Sendable, Codable {
    public let id: ID
    public var name: Name
    public let configuration: Configuration
    public var folder: String
    public let revision: Int
    public let url: URL
    public let _links: [String: AZReferenceLink]?

    public enum _IDTag {}
    public typealias ID = Tagged<_IDTag, Int>

    public enum _NameTag {}
    public typealias Name = Tagged<_NameTag, String>

    public init(
        id: ID,
        name: Name,
        configuration: Configuration,
        folder: String,
        revision: Int,
        url: URL,
        _links: [String: AZReferenceLink]? = nil
    ) {
        self.id = id
        self.name = name
        self.configuration = configuration
        self.folder = folder
        self.revision = revision
        self.url = url
        self._links = _links
    }
}

extension AZPipeline {
    public struct Configuration: Hashable, Sendable, Codable {
        public var type: ConfigurationType
        public var repository: ConfigurationRepository?
        public var path: String?

        public init(type: ConfigurationType, repository: ConfigurationRepository? = nil, path: String? = nil) {
            self.type = type
            self.repository = repository
            self.path = path
        }

        public static let designerHyphenJson: Self = Configuration(type: .designerHyphenJson)
        public static let designerJson: Self = Configuration(type: .designerJson)
        public static let justInTime: Self = Configuration(type: .justInTime)
        public static let unknown: Self = Configuration(type: .unknown)
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
        public let id: RepositoryId
        public let type: RepositoryType

        public init(id: RepositoryId, type: RepositoryType) {
            self.id = id
            self.type = type
        }
    }

    public enum RepositoryType: String, Hashable, Sendable, Codable {
        case azureReposGit
    }

    public enum _RepositoryIdTag {}
    public typealias RepositoryId = Tagged<_RepositoryIdTag, String>
}
