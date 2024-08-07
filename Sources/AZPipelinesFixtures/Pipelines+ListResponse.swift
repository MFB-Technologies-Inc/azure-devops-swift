// Pipelines+ListResponse.swift
// azure-devops-swift
//
// Copyright © 2023 MFB Technologies, Inc. All rights reserved.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import AZCore
import AZCoreFixtures
import AZPipelines
import Foundation

// swiftlint:disable line_length
extension AZFixtures.Pipelines {
    public static let listResponse = AZListResponse<AZPipelineListElement>(
        count: 2,
        value: [
            AZPipelineListElement(
                id: 67,
                name: "archive-blackberry-dev",
                folder: #"\Targets"#.description,
                revision: 4,
                url: URL(
                    string: "https://dev.azure.com/\(AZFixtures.Core.organizationName.description)/\(AZFixtures.Core.projectId.description)/_apis/pipelines/67?revision=4"
                )!,
                _links: [
                    "self": AZReferenceLink(href: URL(string: "https://dev.azure.com/\(AZFixtures.Core.organizationName.description)/\(AZFixtures.Core.projectId.description)/_apis/pipelines/67?revision=4")!),
                    "web": AZReferenceLink(href: URL(string: "https://dev.azure.com/\(AZFixtures.Core.organizationName.description)/\(AZFixtures.Core.projectId.description)/_build/definition?definitionId=67")!),
                ]
            ),
            AZPipelineListElement(
                id: 218,
                name: "veracode-sandbox-scan",
                folder: #"\"#.description,
                revision: 2,
                url: URL(
                    string: "https://dev.azure.com/\(AZFixtures.Core.organizationName.description)/\(AZFixtures.Core.projectId.description)/_apis/pipelines/218?revision=2"
                )!,
                _links: [
                    "self": AZReferenceLink(href: URL(string: "https://dev.azure.com/\(AZFixtures.Core.organizationName.description)/\(AZFixtures.Core.projectId.description)/_apis/pipelines/218?revision=2")!),
                    "web": AZReferenceLink(href: URL(string: "https://dev.azure.com/\(AZFixtures.Core.organizationName.description)/\(AZFixtures.Core.projectId.description)/_build/definition?definitionId=218")!),
                ]
            ),
        ]
    )
}

// swiftlint:enable line_length
