//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by JunHyeok Lee on 3/5/24.
//

import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project: Project = .framework(
    name: "NetworkLibraries",
    packages: Package.Network.All,
    dependencies: TargetDependency.SwiftPM.Network.All
)
