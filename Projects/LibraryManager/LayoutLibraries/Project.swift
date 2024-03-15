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
    name: "LayoutLibraries",
//    settings: [
//        "OTHER_LDFLAGS": [
//            "$(inherited)",
//            "-all_load"
//        ]
//    ],
//    packages: Package.Layout.All,
//    dependencies: TargetDependency.SwiftPM.Layout.All
    dependencies: [
        TargetDependency.Carthage.FlexLayout,
        TargetDependency.Carthage.PinLayout
    ]
)
