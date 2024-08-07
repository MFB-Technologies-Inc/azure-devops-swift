// Pipelines_Json+ListResponse.swift
// azure-devops-swift
//
// Copyright © 2023 MFB Technologies, Inc. All rights reserved.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

// swiftlint:disable line_length

extension AZFixtures.Pipelines.Json {
    public static let listResponse: StaticString = """
    {
      "count": 2,
      "value": [
        {
          "_links": {
            "self": {
              "href": "https://dev.azure.com/azure-devops-swift/00000000-0000-0000-0000-000000000001/_apis/pipelines/67?revision=4"
            },
            "web": {
              "href": "https://dev.azure.com/azure-devops-swift/00000000-0000-0000-0000-000000000001/_build/definition?definitionId=67"
            }
          },
          "url": "https://dev.azure.com/azure-devops-swift/00000000-0000-0000-0000-000000000001/_apis/pipelines/67?revision=4",
          "id": 67,
          "revision": 4,
          "name": "archive-blackberry-dev",
          "folder": "\\\\Targets"
        },
        {
          "_links": {
            "self": {
              "href": "https://dev.azure.com/azure-devops-swift/00000000-0000-0000-0000-000000000001/_apis/pipelines/218?revision=2"
            },
            "web": {
              "href": "https://dev.azure.com/azure-devops-swift/00000000-0000-0000-0000-000000000001/_build/definition?definitionId=218"
            }
          },
          "url": "https://dev.azure.com/azure-devops-swift/00000000-0000-0000-0000-000000000001/_apis/pipelines/218?revision=2",
          "id": 218,
          "revision": 2,
          "name": "veracode-sandbox-scan",
          "folder": "\\\\"
        }
      ]
    }
    """
}

// swiftlint:enable line_length
