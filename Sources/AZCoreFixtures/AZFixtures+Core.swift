// AZFixtures+Core.swift
// azure-devops-swift
//
// Copyright © 2023 MFB Technologies, Inc. All rights reserved.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import AZCore

extension AZFixtures {
    public enum Core {
        public static let branchName: StaticString = #"main"#

        public static let branch = AZBranch(rawValue: branchName.description)

        public static let organizationName: StaticString = #"azure-devops-swift"#

        public static let organization = AZOrganization(rawValue: organizationName.description)

        public static let projectId: StaticString = #"00000000-0000-0000-0000-000000000001"#

        public static let projectName: StaticString = organizationName

        public static let project = AZProject(
            id: AZProject.ID(rawValue: projectId.description),
            name: AZProject.Name(rawValue: projectName.description),
            org: organization
        )
    }
}
