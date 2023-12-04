// AZQueryOrder.swift
// azure-devops-swift
//
// Copyright © 2023 MFB Technologies, Inc. All rights reserved.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

public enum AZQueryOrder: String, Hashable, Encodable, CustomStringConvertible, Sendable {
    case modifiedAsc = "ModifiedAsc"
    case modifiedDesc = "ModifiedDesc"
    case nameAsc = "NameAsc"
    case nameDesc = "NameDesc"
    case none = "None"

    public var description: String { rawValue }
}
