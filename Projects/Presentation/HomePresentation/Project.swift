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
    name: "HomePresentation",
    dependencies: [
        .Project.Common,
        .Project.LibraryManager.Reactive,
        .Project.LibraryManager.Layout,
        .Project.LibraryManager.UI
    ]
)
