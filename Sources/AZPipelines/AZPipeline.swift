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
    public let id: AZPipelineId
    public var name: Name
    public let configuration: Configuration
    public var folder: String
    public let revision: Int
    public let url: URL
    public let _links: [String: AZReferenceLink]?

    public enum _NameTag {}
    public typealias Name = Tagged<_NameTag, String>

    @inlinable
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
