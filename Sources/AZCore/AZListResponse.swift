// AZListResponse.swift
// azure-devops-swift
//
// Copyright © 2023 MFB Technologies, Inc. All rights reserved.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

public struct AZListResponse<T> {
    public let count: Int
    public let value: [T]

    @inlinable
    public init(count: Int, value: [T]) {
        self.count = count
        self.value = value
    }
}

extension AZListResponse: Equatable where T: Equatable {}

extension AZListResponse: Hashable where T: Hashable {}

extension AZListResponse: Sendable where T: Sendable {}

extension AZListResponse: Encodable where T: Encodable {}

extension AZListResponse: Decodable where T: Decodable {}
