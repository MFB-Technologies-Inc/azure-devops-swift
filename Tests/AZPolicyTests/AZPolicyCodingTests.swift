// AZPolicyCodingTests.swift
// azure-devops-swift
//
// Copyright © 2023 MFB Technologies, Inc. All rights reserved.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import AZCore
import AZPolicy
import AZPolicyFixtures
import CustomDump
import Foundation
import TestHelpers
import XCTest

final class AZPolicyCodingTests: XCTestCase {
    func testEncodePolicyTypeListResponse() throws {
        let expectedString = try AZFixtures.PolicyType.Json.listResponse.description.removeJsonFormatting()
        let string = try JSONEncoder.test.encode(AZFixtures.PolicyType.listResponse).utf8String()
        XCTAssertNoDifference(string, expectedString)
    }

    func testDecodePolicyTypeListResponse() throws {
        let responseData = try AZFixtures.PolicyType.Json.listResponse.utf8Data()
        let response = try JSONDecoder.test.decode(AZListResponse<AZPolicyType>.self, from: responseData)
        XCTAssertNoDifference(response, AZFixtures.PolicyType.listResponse)
    }
}
