// Data+Utf8String.swift
// azure-devops-swift
//
// Copyright © 2023 MFB Technologies, Inc. All rights reserved.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import Foundation
import XCTest

extension Data {
    public func utf8String() throws -> String {
        try XCTUnwrap(String(data: self, encoding: .utf8))
    }
}
