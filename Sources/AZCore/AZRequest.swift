// AZRequest.swift
// azure-devops-swift
//
// Copyright © 2023 MFB Technologies, Inc. All rights reserved.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import Foundation
import HTTPTypes

public protocol AZRequest {
    var queryItems: [String: String] { get }
    var method: HTTPRequest.Method { get }
    func body(encoder: some JSONEncoder) throws -> Data?
}
