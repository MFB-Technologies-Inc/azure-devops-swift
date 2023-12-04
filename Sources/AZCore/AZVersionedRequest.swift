// AZVersionedRequest.swift
// azure-devops-swift
//
// Copyright © 2023 MFB Technologies, Inc. All rights reserved.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

public protocol AZVersionedRequest: AZRequest {
    var apiVersion: AZApiVersion { get }
}

public protocol AZVersionedRequest_7_0: AZVersionedRequest {}

extension AZVersionedRequest_7_0 {
    public var apiVersion: AZApiVersion { .sevenDotZero }
}
