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
    name: "BasePresentation",
    dependencies: [
        .Project.LibraryManager.Layout,
        .Project.LibraryManager.Reactive,
        .Project.LibraryManager.UI,
        .Project.Common
    ]
)
