// AZApiVersion.swift
// azure-devops-swift
//
// Copyright © 2023 MFB Technologies, Inc. All rights reserved.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import Tagged

public enum _ApiVersionTag {}
public typealias AZApiVersion = Tagged<_ApiVersionTag, String>

extension AZApiVersion {
    public static let sevenDotZero: Self = "7.0"
}
