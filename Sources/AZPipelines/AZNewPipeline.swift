// AZNewPipeline.swift
// azure-devops-swift
//
// Copyright © 2023 MFB Technologies, Inc. All rights reserved.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import Foundation
import Tagged

public struct AZNewPipeline: Hashable, Sendable, Codable {
    public let name: AZPipeline.Name
    public let folder: String
    public let configuration: AZPipeline.Configuration

    @inlinable
    public init(name: AZPipeline.Name, folder: String, configuration: AZPipeline.Configuration) {
        self.name = name
        self.folder = folder
        self.configuration = configuration
    }
}

extension AZNewPipeline: Identifiable {
    public typealias ID = Tagged<Self, String>

    @inlinable
    public var id: ID {
        ID(folder + name.rawValue)
    }
}
