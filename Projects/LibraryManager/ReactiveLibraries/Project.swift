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
    name: "ReactiveLibraries",
    packages: Package.Reactive.All,
    dependencies: TargetDependency.SwiftPM.Reactive.All
)
