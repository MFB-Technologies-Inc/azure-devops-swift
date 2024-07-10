// PolicyType+ListResponse.swift
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
