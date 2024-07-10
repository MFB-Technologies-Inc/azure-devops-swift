// AZResourceReference.swift
// azure-devops-swift
//
// Copyright © 2023 MFB Technologies, Inc. All rights reserved.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import Foundation

public struct AZResourceReference<R>: Identifiable where R: Identifiable {
    public let id: R.ID

    @inlinable
    public init(id: R.ID) {
        self.id = id
    }

    @inlinable
    public init(resource: R) {
        self.init(id: resource.id)
    }
}

extension AZResourceReference: Hashable where R.ID: Hashable {}

extension AZResourceReference: Sendable where R.ID: Sendable {}

extension AZResourceReference: Encodable where R.ID: Encodable {}

extension AZResourceReference: Decodable where R.ID: Decodable {}
