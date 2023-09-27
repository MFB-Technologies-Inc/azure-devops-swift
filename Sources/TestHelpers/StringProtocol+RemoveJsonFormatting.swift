// StringProtocol+RemoveJsonFormatting.swift
// azure-devops-swift
//
// Copyright © 2023 MFB Technologies, Inc. All rights reserved.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import Foundation
import XCTest

extension StringProtocol {
    /// Returns a String with all whitespace and newlines removed
    public func removeJsonFormatting() throws -> String {
        let object = try JSONSerialization.jsonObject(with: XCTUnwrap(data(using: .utf8)))
        let data = try JSONSerialization.data(withJSONObject: object, options: .sortedKeys)
        return try XCTUnwrap(String(data: data, encoding: .utf8))
    }
}
