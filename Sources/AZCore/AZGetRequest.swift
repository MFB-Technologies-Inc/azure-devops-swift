// AZGetRequest.swift
// azure-devops-swift
//
// Copyright © 2023 MFB Technologies, Inc. All rights reserved.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import Foundation
import HTTPTypes

public protocol AZGetRequest: AZRequest {}

extension AZGetRequest {
    public var method: HTTPRequest.Method { .get }
    public func body(encoder _: some JSONEncoder) throws -> Data? {
        nil
    }
}
