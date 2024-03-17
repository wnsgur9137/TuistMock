//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by JunHyeok Lee on 3/7/24.
//

import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project: Project = .framework(
    name: "Network",
    dependencies: [
        .Project.LibraryManager.Network,
        .Project.LibraryManager.Reactive
    ]
)
