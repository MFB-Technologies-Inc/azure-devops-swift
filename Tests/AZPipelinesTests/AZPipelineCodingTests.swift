// AZPipelineCodingTests.swift
// azure-devops-swift
//
// Copyright © 2023 MFB Technologies, Inc. All rights reserved.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import AZCore
import AZPipelines
import AZPipelinesFixtures
import CustomDump
import Foundation
import TestHelpers
import XCTest

final class AZPipelineCodingTests: XCTestCase {
    func testEncodePipelineListResponse() throws {
        let expectedString = try AZFixtures.Pipelines.Json.listResponse.description.removeJsonFormatting()
        let string = try JSONEncoder.test.encode(AZFixtures.Pipelines.listResponse).utf8String()
        XCTAssertNoDifference(string, expectedString)
    }

    func testDecodePipelineListResponse() throws {
        let responseData = AZFixtures.Pipelines.Json.listResponse.utf8Data()
        let response = try JSONDecoder.test.decode(AZListResponse<AZPipelineListElement>.self, from: responseData)
        XCTAssertNoDifference(response, AZFixtures.Pipelines.listResponse)
    }
}
