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
    name: "HomeData",
    dependencies: [
        .Project.Feature.Data.Base,
        .Project.Feature.Domain.Home
    ]
)
