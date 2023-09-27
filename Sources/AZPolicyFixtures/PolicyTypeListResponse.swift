// PolicyTypeListResponse.swift
// azure-devops-swift
//
// Copyright © 2023 MFB Technologies, Inc. All rights reserved.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import AZCore
import AZCoreFixtures
import AZPolicy
import Foundation

extension AZFixtures.PolicyType {
    public static let listResponse: AZListResponse<AZPolicyType> = AZListResponse(
        count: 18,
        value: [
            AZFixtures.PolicyType.build,
            AZFixtures.PolicyType.commentRequirements,
            AZFixtures.PolicyType.commitAuthorEmailValidation,
            AZFixtures.PolicyType.fileNameRestriction,
            AZFixtures.PolicyType.fileSizeRestriction,
            AZFixtures.PolicyType.gitCommitHardLimitsPushPolicy,
            AZFixtures.PolicyType.gitRepositorySettings,
            AZFixtures.PolicyType.gitRepositorySettingsPolicyName,
            AZFixtures.PolicyType.minimumNumberOfReviewers,
            AZFixtures.PolicyType.pathLengthRestriction,
            AZFixtures.PolicyType.requireAMergeStrategy,
            AZFixtures.PolicyType.requiredReviewers,
            AZFixtures.PolicyType.reservedNamesRestriction,
            AZFixtures.PolicyType.secretsScanningRestriction,
            AZFixtures.PolicyType.status,
            AZFixtures.PolicyType.workItemLinking,
        ]
    )
}

// swiftlint:disable line_length
extension AZFixtures.PolicyType.Json {
    public static let listResponse: StaticString = """
    {
      "count": 18,
      "value": [
        {
          "_links": {
            "self": {
              "href": "https://dev.azure.com/azure-devops-swift/00000000-0000-0000-0000-000000000001/_apis/policy/types/0609b952-1397-4640-95ec-e00a01b2c241"
            }
          },
          "description": "This policy will require a successful build has been performed before updating protected refs.",
          "displayName": "Build",
          "id": "0609b952-1397-4640-95ec-e00a01b2c241",
          "url": "https://dev.azure.com/azure-devops-swift/00000000-0000-0000-0000-000000000001/_apis/policy/types/0609b952-1397-4640-95ec-e00a01b2c241"
        },
        {
          "_links": {
            "self": {
              "href": "https://dev.azure.com/azure-devops-swift/00000000-0000-0000-0000-000000000001/_apis/policy/types/c6a1889d-b943-4856-b76f-9e46bb6b0df2"
            }
          },
          "description": "Check if the pull request has any active comments",
          "displayName": "Comment requirements",
          "id": "c6a1889d-b943-4856-b76f-9e46bb6b0df2",
          "url": "https://dev.azure.com/azure-devops-swift/00000000-0000-0000-0000-000000000001/_apis/policy/types/c6a1889d-b943-4856-b76f-9e46bb6b0df2"
        },
        {
          "_links": {
            "self": {
              "href": "https://dev.azure.com/azure-devops-swift/00000000-0000-0000-0000-000000000001/_apis/policy/types/77ed4bd3-b063-4689-934a-175e4d0a78d7"
            }
          },
          "description": "This policy will block pushes from including commits where the author email does not match the specified patterns.",
          "displayName": "Commit author email validation",
          "id": "77ed4bd3-b063-4689-934a-175e4d0a78d7",
          "url": "https://dev.azure.com/azure-devops-swift/00000000-0000-0000-0000-000000000001/_apis/policy/types/77ed4bd3-b063-4689-934a-175e4d0a78d7"
        },
        {
          "_links": {
            "self": {
              "href": "https://dev.azure.com/azure-devops-swift/00000000-0000-0000-0000-000000000001/_apis/policy/types/51c78909-e838-41a2-9496-c647091e3c61"
            }
          },
          "description": "This policy will reject pushes to a repository which add file paths that match the specified patterns.",
          "displayName": "File name restriction",
          "id": "51c78909-e838-41a2-9496-c647091e3c61",
          "url": "https://dev.azure.com/azure-devops-swift/00000000-0000-0000-0000-000000000001/_apis/policy/types/51c78909-e838-41a2-9496-c647091e3c61"
        },
        {
          "_links": {
            "self": {
              "href": "https://dev.azure.com/azure-devops-swift/00000000-0000-0000-0000-000000000001/_apis/policy/types/2e26e725-8201-4edd-8bf5-978563c34a80"
            }
          },
          "description": "This policy will reject pushes to a repository for files which exceed the specified size.",
          "displayName": "File size restriction",
          "id": "2e26e725-8201-4edd-8bf5-978563c34a80",
          "url": "https://dev.azure.com/azure-devops-swift/00000000-0000-0000-0000-000000000001/_apis/policy/types/2e26e725-8201-4edd-8bf5-978563c34a80"
        },
        {
          "_links": {
            "self": {
              "href": "https://dev.azure.com/azure-devops-swift/00000000-0000-0000-0000-000000000001/_apis/policy/types/90231074-b810-4521-ac14-ca5aa6781f42"
            }
          },
          "description": "Push policy that performs validation of commits and enforces certain hard limits for the number of entries in a commit and file and directory path length",
          "displayName": "Git Commit Hard Limits Push Policy",
          "id": "90231074-b810-4521-ac14-ca5aa6781f42",
          "url": "https://dev.azure.com/azure-devops-swift/00000000-0000-0000-0000-000000000001/_apis/policy/types/90231074-b810-4521-ac14-ca5aa6781f42"
        },
        {
          "_links": {
            "self": {
              "href": "https://dev.azure.com/azure-devops-swift/00000000-0000-0000-0000-000000000001/_apis/policy/types/7ed39669-655c-494e-b4a0-a08b4da0fcce"
            }
          },
          "description": "Git repository settings",
          "displayName": "Git repository settings",
          "id": "7ed39669-655c-494e-b4a0-a08b4da0fcce",
          "url": "https://dev.azure.com/azure-devops-swift/00000000-0000-0000-0000-000000000001/_apis/policy/types/7ed39669-655c-494e-b4a0-a08b4da0fcce"
        },
        {
          "_links": {
            "self": {
              "href": "https://dev.azure.com/azure-devops-swift/00000000-0000-0000-0000-000000000001/_apis/policy/types/0517f88d-4ec5-4343-9d26-9930ebd53069"
            }
          },
          "description": "GitRepositorySettingsPolicyName",
          "displayName": "GitRepositorySettingsPolicyName",
          "id": "0517f88d-4ec5-4343-9d26-9930ebd53069",
          "url": "https://dev.azure.com/azure-devops-swift/00000000-0000-0000-0000-000000000001/_apis/policy/types/0517f88d-4ec5-4343-9d26-9930ebd53069"
        },
        {
          "_links": {
            "self": {
              "href": "https://dev.azure.com/azure-devops-swift/00000000-0000-0000-0000-000000000001/_apis/policy/types/fa4e907d-c16b-4a4c-9dfa-4906e5d171dd"
            }
          },
          "description": "This policy will ensure that a minimum number of reviewers have approved a pull request before completion.",
          "displayName": "Minimum number of reviewers",
          "id": "fa4e907d-c16b-4a4c-9dfa-4906e5d171dd",
          "url": "https://dev.azure.com/azure-devops-swift/00000000-0000-0000-0000-000000000001/_apis/policy/types/fa4e907d-c16b-4a4c-9dfa-4906e5d171dd"
        },
        {
          "_links": {
            "self": {
              "href": "https://dev.azure.com/azure-devops-swift/00000000-0000-0000-0000-000000000001/_apis/policy/types/001a79cf-fda1-4c4e-9e7c-bac40ee5ead8"
            }
          },
          "description": "This policy will reject pushes to a repository for paths which exceed the specified length.",
          "displayName": "Path Length restriction",
          "id": "001a79cf-fda1-4c4e-9e7c-bac40ee5ead8",
          "url": "https://dev.azure.com/azure-devops-swift/00000000-0000-0000-0000-000000000001/_apis/policy/types/001a79cf-fda1-4c4e-9e7c-bac40ee5ead8"
        },
        {
          "_links": {
            "self": {
              "href": "https://dev.azure.com/azure-devops-swift/00000000-0000-0000-0000-000000000001/_apis/policy/types/fa4e907d-c16b-4a4c-9dfa-4916e5d171ab"
            }
          },
          "description": "This policy ensures that pull requests use a consistent merge strategy.",
          "displayName": "Require a merge strategy",
          "id": "fa4e907d-c16b-4a4c-9dfa-4916e5d171ab",
          "url": "https://dev.azure.com/azure-devops-swift/00000000-0000-0000-0000-000000000001/_apis/policy/types/fa4e907d-c16b-4a4c-9dfa-4916e5d171ab"
        },
        {
          "_links": {
            "self": {
              "href": "https://dev.azure.com/azure-devops-swift/00000000-0000-0000-0000-000000000001/_apis/policy/types/fd2167ab-b0be-447a-8ec8-39368250530e"
            }
          },
          "description": "This policy will ensure that required reviewers are added for modified files matching specified patterns.",
          "displayName": "Required reviewers",
          "id": "fd2167ab-b0be-447a-8ec8-39368250530e",
          "url": "https://dev.azure.com/azure-devops-swift/00000000-0000-0000-0000-000000000001/_apis/policy/types/fd2167ab-b0be-447a-8ec8-39368250530e"
        },
        {
          "_links": {
            "self": {
              "href": "https://dev.azure.com/azure-devops-swift/00000000-0000-0000-0000-000000000001/_apis/policy/types/db2b9b4c-180d-4529-9701-01541d19f36b"
            }
          },
          "description": "This policy will reject pushes to a repository for names which aren't valid on all supported client OSes.",
          "displayName": "Reserved names restriction",
          "id": "db2b9b4c-180d-4529-9701-01541d19f36b",
          "url": "https://dev.azure.com/azure-devops-swift/00000000-0000-0000-0000-000000000001/_apis/policy/types/db2b9b4c-180d-4529-9701-01541d19f36b"
        },
        {
          "_links": {
            "self": {
              "href": "https://dev.azure.com/azure-devops-swift/00000000-0000-0000-0000-000000000001/_apis/policy/types/ec003f37-8db0-4e10-992a-a2895045752c"
            }
          },
          "description": "This policy will reject pushes to a repository for files that contain credentials or secrets.",
          "displayName": "Secrets scanning restriction",
          "id": "ec003f37-8db0-4e10-992a-a2895045752c",
          "url": "https://dev.azure.com/azure-devops-swift/00000000-0000-0000-0000-000000000001/_apis/policy/types/ec003f37-8db0-4e10-992a-a2895045752c"
        },
        {
          "_links": {
            "self": {
              "href": "https://dev.azure.com/azure-devops-swift/00000000-0000-0000-0000-000000000001/_apis/policy/types/cbdc66da-9728-4af8-aada-9a5a32e4a226"
            }
          },
          "description": "This policy will require a successfull status to be posted before updating protected refs.",
          "displayName": "Status",
          "id": "cbdc66da-9728-4af8-aada-9a5a32e4a226",
          "url": "https://dev.azure.com/azure-devops-swift/00000000-0000-0000-0000-000000000001/_apis/policy/types/cbdc66da-9728-4af8-aada-9a5a32e4a226"
        },
        {
          "_links": {
            "self": {
              "href": "https://dev.azure.com/azure-devops-swift/00000000-0000-0000-0000-000000000001/_apis/policy/types/40e92b44-2fe1-4dd6-b3d8-74a9c21d0c6e"
            }
          },
          "description": "This policy encourages developers to link commits to work items.",
          "displayName": "Work item linking",
          "id": "40e92b44-2fe1-4dd6-b3d8-74a9c21d0c6e",
          "url": "https://dev.azure.com/azure-devops-swift/00000000-0000-0000-0000-000000000001/_apis/policy/types/40e92b44-2fe1-4dd6-b3d8-74a9c21d0c6e"
        }
      ]
    }

    """
}

// swiftlint:enable line_length
