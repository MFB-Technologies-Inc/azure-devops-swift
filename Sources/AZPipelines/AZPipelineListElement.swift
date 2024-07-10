// AZPipelineListElement.swift
// azure-devops-swift
//
// Copyright © 2023 MFB Technologies, Inc. All rights reserved.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import AZCore
import Foundation
import Tagged

public struct AZPipelineListElement: Identifiable, Hashable, Sendable, Codable {
    public let id: AZPipeline.ID
    public var name: AZPipeline.Name
    public var folder: String
    public let revision: Int
    public let url: URL
    public let _links: [String: AZReferenceLink]?

    @inlinable
    public init(
        id: AZPipeline.ID,
        name: AZPipeline.Name,
        folder: String,
        revision: Int,
        url: URL,
        _links: [String: AZReferenceLink]? = nil
    ) {
        self.id = id
        self.name = name
        self.folder = folder
        self.revision = revision
        self.url = url
        self._links = _links
    }
}
