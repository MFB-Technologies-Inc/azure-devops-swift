// JSONDecoder+Test.swift
// azure-devops-swift
//
// Copyright © 2023 MFB Technologies, Inc. All rights reserved.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import Foundation

extension JSONDecoder {
    public static let test: JSONDecoder = {
        let decoder = JSONDecoder()
        return decoder
    }()
}
