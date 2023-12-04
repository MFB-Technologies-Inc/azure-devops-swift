// PolicyType.swift
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

// swiftlint:disable line_length
extension AZFixtures.PolicyType {
    public static let secretsScanningRestriction = AZPolicyType(
        id: "ec003f37-8db0-4e10-992a-a2895045752c",
        displayName: "Secrets scanning restriction",
        url: URL(
            string: "https://dev.azure.com/\(AZFixtures.Core.organization.description)/\(AZFixtures.Core.projectId.description)/_apis/policy/types/ec003f37-8db0-4e10-992a-a2895045752c"
        )!,
        description: "This policy will reject pushes to a repository for files that contain credentials or secrets.",
        _links: [
            "self": AZReferenceLink(href: URL(string: "https://dev.azure.com/\(AZFixtures.Core.organization.description)/\(AZFixtures.Core.projectId.description)/_apis/policy/types/ec003f37-8db0-4e10-992a-a2895045752c")!),
        ]
    )
    public static let gitCommitHardLimitsPushPolicy = AZPolicyType(
        id: "90231074-b810-4521-ac14-ca5aa6781f42",
        displayName: "Git Commit Hard Limits Push Policy",
        url: URL(
            string: "https://dev.azure.com/\(AZFixtures.Core.organization.description)/\(AZFixtures.Core.projectId.description)/_apis/policy/types/90231074-b810-4521-ac14-ca5aa6781f42"
        )!,
        description: "Push policy that performs validation of commits and enforces certain hard limits for the number of entries in a commit and file and directory path length",
        _links: [
            "self": AZReferenceLink(href: URL(string: "https://dev.azure.com/\(AZFixtures.Core.organization.description)/\(AZFixtures.Core.projectId.description)/_apis/policy/types/90231074-b810-4521-ac14-ca5aa6781f42")!),
        ]
    )
    public static let pathLengthRestriction = AZPolicyType(
        id: "001a79cf-fda1-4c4e-9e7c-bac40ee5ead8",
        displayName: "Path Length restriction",
        url: URL(
            string: "https://dev.azure.com/\(AZFixtures.Core.organization.description)/\(AZFixtures.Core.projectId.description)/_apis/policy/types/001a79cf-fda1-4c4e-9e7c-bac40ee5ead8"
        )!,
        description: "This policy will reject pushes to a repository for paths which exceed the specified length.",
        _links: [
            "self": AZReferenceLink(href: URL(string: "https://dev.azure.com/\(AZFixtures.Core.organization.description)/\(AZFixtures.Core.projectId.description)/_apis/policy/types/001a79cf-fda1-4c4e-9e7c-bac40ee5ead8")!),
        ]
    )
    public static let reservedNamesRestriction = AZPolicyType(
        id: "db2b9b4c-180d-4529-9701-01541d19f36b",
        displayName: "Reserved names restriction",
        url: URL(
            string: "https://dev.azure.com/\(AZFixtures.Core.organization.description)/\(AZFixtures.Core.projectId.description)/_apis/policy/types/db2b9b4c-180d-4529-9701-01541d19f36b"
        )!,
        description: "This policy will reject pushes to a repository for names which aren't valid on all supported client OSes.",
        _links: [
            "self": AZReferenceLink(href: URL(string: "https://dev.azure.com/\(AZFixtures.Core.organization.description)/\(AZFixtures.Core.projectId.description)/_apis/policy/types/db2b9b4c-180d-4529-9701-01541d19f36b")!),
        ]
    )
    public static let requireAMergeStrategy = AZPolicyType(
        id: "fa4e907d-c16b-4a4c-9dfa-4916e5d171ab",
        displayName: "Require a merge strategy",
        url: URL(
            string: "https://dev.azure.com/\(AZFixtures.Core.organization.description)/\(AZFixtures.Core.projectId.description)/_apis/policy/types/fa4e907d-c16b-4a4c-9dfa-4916e5d171ab"
        )!,
        description: "This policy ensures that pull requests use a consistent merge strategy.",
        _links: [
            "self": AZReferenceLink(href: URL(string: "https://dev.azure.com/\(AZFixtures.Core.organization.description)/\(AZFixtures.Core.projectId.description)/_apis/policy/types/fa4e907d-c16b-4a4c-9dfa-4916e5d171ab")!),
        ]
    )
    public static let commentRequirements = AZPolicyType(
        id: "c6a1889d-b943-4856-b76f-9e46bb6b0df2",
        displayName: "Comment requirements",
        url: URL(
            string: "https://dev.azure.com/\(AZFixtures.Core.organization.description)/\(AZFixtures.Core.projectId.description)/_apis/policy/types/c6a1889d-b943-4856-b76f-9e46bb6b0df2"
        )!,
        description: "Check if the pull request has any active comments",
        _links: [
            "self": AZReferenceLink(href: URL(string: "https://dev.azure.com/\(AZFixtures.Core.organization.description)/\(AZFixtures.Core.projectId.description)/_apis/policy/types/c6a1889d-b943-4856-b76f-9e46bb6b0df2")!),
        ]
    )
    public static let status = AZPolicyType(
        id: "cbdc66da-9728-4af8-aada-9a5a32e4a226",
        displayName: "Status",
        url: URL(
            string: "https://dev.azure.com/\(AZFixtures.Core.organization.description)/\(AZFixtures.Core.projectId.description)/_apis/policy/types/cbdc66da-9728-4af8-aada-9a5a32e4a226"
        )!,
        description: "This policy will require a successfull status to be posted before updating protected refs.",
        _links: [
            "self": AZReferenceLink(href: URL(string: "https://dev.azure.com/\(AZFixtures.Core.organization.description)/\(AZFixtures.Core.projectId.description)/_apis/policy/types/cbdc66da-9728-4af8-aada-9a5a32e4a226")!),
        ]
    )
    public static let gitRepositorySettings = AZPolicyType(
        id: "7ed39669-655c-494e-b4a0-a08b4da0fcce",
        displayName: "Git repository settings",
        url: URL(
            string: "https://dev.azure.com/\(AZFixtures.Core.organization.description)/\(AZFixtures.Core.projectId.description)/_apis/policy/types/7ed39669-655c-494e-b4a0-a08b4da0fcce"
        )!,
        description: "Git repository settings",
        _links: [
            "self": AZReferenceLink(href: URL(string: "https://dev.azure.com/\(AZFixtures.Core.organization.description)/\(AZFixtures.Core.projectId.description)/_apis/policy/types/7ed39669-655c-494e-b4a0-a08b4da0fcce")!),
        ]
    )
    public static let build = AZPolicyType(
        id: "0609b952-1397-4640-95ec-e00a01b2c241",
        displayName: .build,
        url: URL(
            string: "https://dev.azure.com/\(AZFixtures.Core.organization.description)/\(AZFixtures.Core.projectId.description)/_apis/policy/types/0609b952-1397-4640-95ec-e00a01b2c241"
        )!,
        description: "This policy will require a successful build has been performed before updating protected refs.",
        _links: [
            "self": AZReferenceLink(href: URL(string: "https://dev.azure.com/\(AZFixtures.Core.organization.description)/\(AZFixtures.Core.projectId.description)/_apis/policy/types/0609b952-1397-4640-95ec-e00a01b2c241")!),
        ]
    )
    public static let fileSizeRestriction = AZPolicyType(
        id: "2e26e725-8201-4edd-8bf5-978563c34a80",
        displayName: "File size restriction",
        url: URL(
            string: "https://dev.azure.com/\(AZFixtures.Core.organization.description)/\(AZFixtures.Core.projectId.description)/_apis/policy/types/2e26e725-8201-4edd-8bf5-978563c34a80"
        )!,
        description: "This policy will reject pushes to a repository for files which exceed the specified size.",
        _links: [
            "self": AZReferenceLink(href: URL(string: "https://dev.azure.com/\(AZFixtures.Core.organization.description)/\(AZFixtures.Core.projectId.description)/_apis/policy/types/2e26e725-8201-4edd-8bf5-978563c34a80")!),
        ]
    )
    public static let fileNameRestriction = AZPolicyType(
        id: "51c78909-e838-41a2-9496-c647091e3c61",
        displayName: "File name restriction",
        url: URL(
            string: "https://dev.azure.com/\(AZFixtures.Core.organization.description)/\(AZFixtures.Core.projectId.description)/_apis/policy/types/51c78909-e838-41a2-9496-c647091e3c61"
        )!,
        description: "This policy will reject pushes to a repository which add file paths that match the specified patterns.",
        _links: [
            "self": AZReferenceLink(href: URL(string: "https://dev.azure.com/\(AZFixtures.Core.organization.description)/\(AZFixtures.Core.projectId.description)/_apis/policy/types/51c78909-e838-41a2-9496-c647091e3c61")!),
        ]
    )
    public static let commitAuthorEmailValidation = AZPolicyType(
        id: "77ed4bd3-b063-4689-934a-175e4d0a78d7",
        displayName: "Commit author email validation",
        url: URL(
            string: "https://dev.azure.com/\(AZFixtures.Core.organization.description)/\(AZFixtures.Core.projectId.description)/_apis/policy/types/77ed4bd3-b063-4689-934a-175e4d0a78d7"
        )!,
        description: "This policy will block pushes from including commits where the author email does not match the specified patterns.",
        _links: [
            "self": AZReferenceLink(href: URL(string: "https://dev.azure.com/\(AZFixtures.Core.organization.description)/\(AZFixtures.Core.projectId.description)/_apis/policy/types/77ed4bd3-b063-4689-934a-175e4d0a78d7")!),
        ]
    )
    public static let requiredReviewers = AZPolicyType(
        id: "fd2167ab-b0be-447a-8ec8-39368250530e",
        displayName: "Required reviewers",
        url: URL(
            string: "https://dev.azure.com/\(AZFixtures.Core.organization.description)/\(AZFixtures.Core.projectId.description)/_apis/policy/types/fd2167ab-b0be-447a-8ec8-39368250530e"
        )!,
        description: "This policy will ensure that required reviewers are added for modified files matching specified patterns.",
        _links: [
            "self": AZReferenceLink(href: URL(string: "https://dev.azure.com/\(AZFixtures.Core.organization.description)/\(AZFixtures.Core.projectId.description)/_apis/policy/types/fd2167ab-b0be-447a-8ec8-39368250530e")!),
        ]
    )
    public static let minimumNumberOfReviewers = AZPolicyType(
        id: "fa4e907d-c16b-4a4c-9dfa-4906e5d171dd",
        displayName: "Minimum number of reviewers",
        url: URL(
            string: "https://dev.azure.com/\(AZFixtures.Core.organization.description)/\(AZFixtures.Core.projectId.description)/_apis/policy/types/fa4e907d-c16b-4a4c-9dfa-4906e5d171dd"
        )!,
        description: "This policy will ensure that a minimum number of reviewers have approved a pull request before completion.",
        _links: [
            "self": AZReferenceLink(href: URL(string: "https://dev.azure.com/\(AZFixtures.Core.organization.description)/\(AZFixtures.Core.projectId.description)/_apis/policy/types/fa4e907d-c16b-4a4c-9dfa-4906e5d171dd")!),
        ]
    )
    public static let workItemLinking = AZPolicyType(
        id: "40e92b44-2fe1-4dd6-b3d8-74a9c21d0c6e",
        displayName: "Work item linking",
        url: URL(
            string: "https://dev.azure.com/\(AZFixtures.Core.organization.description)/\(AZFixtures.Core.projectId.description)/_apis/policy/types/40e92b44-2fe1-4dd6-b3d8-74a9c21d0c6e"
        )!,
        description: "This policy encourages developers to link commits to work items.",
        _links: [
            "self": AZReferenceLink(href: URL(string: "https://dev.azure.com/\(AZFixtures.Core.organization.description)/\(AZFixtures.Core.projectId.description)/_apis/policy/types/40e92b44-2fe1-4dd6-b3d8-74a9c21d0c6e")!),
        ]
    )
    public static let gitRepositorySettingsPolicyName = AZPolicyType(
        id: "0517f88d-4ec5-4343-9d26-9930ebd53069",
        displayName: "GitRepositorySettingsPolicyName",
        url: URL(
            string: "https://dev.azure.com/\(AZFixtures.Core.organization.description)/\(AZFixtures.Core.projectId.description)/_apis/policy/types/0517f88d-4ec5-4343-9d26-9930ebd53069"
        )!,
        description: "GitRepositorySettingsPolicyName",
        _links: [
            "self": AZReferenceLink(href: URL(string: "https://dev.azure.com/\(AZFixtures.Core.organization.description)/\(AZFixtures.Core.projectId.description)/_apis/policy/types/0517f88d-4ec5-4343-9d26-9930ebd53069")!),
        ]
    )
}

// swiftlint:enable line_length
