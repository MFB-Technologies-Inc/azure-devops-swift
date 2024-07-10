// AZPostRequest.swift
// azure-devops-swift
//
// Copyright © 2023 MFB Technologies, Inc. All rights reserved.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import HTTPTypes

public protocol AZPostRequest: AZRequest {}

extension AZPostRequest {
    public var method: HTTPRequest.Method { .post }
}
