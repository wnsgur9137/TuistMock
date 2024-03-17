//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by JunHyeok Lee on 3/7/24.
//

import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project: Project = .staticFramework(
    name: "RepositoryInjectManager",
    dependencies: [
        .Project.Infrastructure.Network,
        .Project.TabBar
    ]
)
