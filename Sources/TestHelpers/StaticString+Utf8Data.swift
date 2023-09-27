// StaticString+Utf8Data.swift
// azure-devops-swift
//
// Copyright © 2023 MFB Technologies, Inc. All rights reserved.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import Foundation
import XCTest

extension StaticString {
    public func utf8Data() throws -> Data {
        try XCTUnwrap(description.data(using: .utf8))
    }
}
