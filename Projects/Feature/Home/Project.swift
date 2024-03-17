//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by JunHyeok Lee on 3/5/24.
//

import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project: Project = .staticFramework(
    name: "Home",
    dependencies: [
        .Project.Feature.Presentation.Home,
        .Project.Feature.Domain.Home,
        .Project.Feature.Data.Home
    ]
)
