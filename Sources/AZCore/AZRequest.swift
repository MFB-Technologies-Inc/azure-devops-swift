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

public protocol AZDeleteRequest: AZRequest {}

extension AZDeleteRequest {
    public var method: HTTPRequest.Method { .delete }
    public func body(encoder _: some JSONEncoder) throws -> Data? {
        nil
    }
}

public protocol AZGetRequest: AZRequest {}

extension AZGetRequest {
    public var method: HTTPRequest.Method { .get }
    public func body(encoder _: some JSONEncoder) throws -> Data? {
        nil
    }
}

public protocol AZPostRequest: AZRequest {}

extension AZPostRequest {
    public var method: HTTPRequest.Method { .post }
}

public protocol AZPutRequest: AZRequest {}

extension AZPutRequest {
    public var method: HTTPRequest.Method { .put }
}
