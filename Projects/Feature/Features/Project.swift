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
    name: "Features",
    dependencies: [
        .Project.Feature.Home,
        .Project.Feature.Search,
        .Project.Feature.Setting
    ]
)
