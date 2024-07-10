// AZCreateRequest.swift
// azure-devops-swift
//
// Copyright © 2023 MFB Technologies, Inc. All rights reserved.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import Foundation
import Tagged

public struct AZCreateRequest<T>: AZVersionedRequest, AZPostRequest where T: Encodable {
    public let apiVersion: AZApiVersion
    public let body: T

    @inlinable
    public var queryItems: [String: String] {
        [
            "api-version": apiVersion.rawValue,
        ]
    }

    @inlinable
    public func body(encoder: some JSONEncoder) throws -> Data? {
        try? encoder.encode(body)
    }

    @inlinable
    public init(apiVersion: AZApiVersion, body: T) {
        self.apiVersion = apiVersion
        self.body = body
    }

    @inlinable
    public static func sevenDotZero(body: T) -> Self {
        AZCreateRequest(apiVersion: .sevenDotZero, body: body)
    }
}

extension AZCreateRequest: Equatable where T: Equatable {}

extension AZCreateRequest: Hashable where T: Hashable {}

extension AZCreateRequest: Sendable where T: Sendable {}

extension AZCreateRequest: Encodable where T: Encodable {}

extension AZCreateRequest: Decodable where T: Decodable {}
