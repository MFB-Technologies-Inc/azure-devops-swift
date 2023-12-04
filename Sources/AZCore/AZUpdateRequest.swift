// AZUpdateRequest.swift
// azure-devops-swift
//
// Copyright © 2023 MFB Technologies, Inc. All rights reserved.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import Foundation

public struct AZUpdateRequest<T>: AZVersionedRequest, AZPutRequest where T: Encodable {
    public let apiVersion: AZApiVersion
    public let body: T

    public var queryItems: [String: String] {
        [
            "api-version": apiVersion.rawValue,
        ]
    }

    public func body(encoder: some JSONEncoder) throws -> Data? {
        try? encoder.encode(body)
    }

    public init(apiVersion: AZApiVersion, body: T) {
        self.apiVersion = apiVersion
        self.body = body
    }

    public static func sevenDotZero(body: T) -> Self {
        AZUpdateRequest(apiVersion: .sevenDotZero, body: body)
    }
}

extension AZUpdateRequest: Equatable where T: Equatable {}

extension AZUpdateRequest: Hashable where T: Hashable {}

extension AZUpdateRequest: Sendable where T: Sendable {}

extension AZUpdateRequest: Encodable where T: Encodable {}

extension AZUpdateRequest: Decodable where T: Decodable {}
