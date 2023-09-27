// AZProject.swift
// azure-devops-swift
//
// Copyright © 2023 MFB Technologies, Inc. All rights reserved.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import Foundation
import Tagged

public struct AZProject: Hashable, Identifiable, Codable, Sendable {
    public let id: ID
    public let name: Name
    public let org: AZOrganization

    public init(id: ID, name: Name, org: AZOrganization) {
        self.id = id
        self.name = name
        self.org = org
    }

    public typealias ID = Tagged<_IDTag, String>
    public typealias Name = Tagged<_NameTag, String>

    public enum _IDTag {}
    public enum _NameTag {}
}
