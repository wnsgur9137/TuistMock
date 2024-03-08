//
//  Dependencies.swift
//  ProjectDescriptionHelpers
//
//  Created by JunHyeok Lee on 3/8/24.
//

import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let dependencies: Dependencies = .init(
    carthage:
        [
            .github(path: "https://github.com/layoutBox/FlexLayout.git", requirement: .branch("master")),
            .github(path: "https://github.com/layoutBox/PinLayout.git", requirement: .branch("master"))
        ],
    swiftPackageManager: SwiftPackageManagerDependencies(
        [
            .remote(url: "https://github.com/ReactiveX/RxSwift.git", requirement: .upToNextMajor(from: "6.5.0")),
            .remote(url: "https://github.com/RxSwiftCommunity/RxGesture.git", requirement: .upToNextMajor(from: "4.0.0")),
        ],
        productTypes: [
            "RxCocoaRuntime": .framework
        ]
    ),
    platforms: [.iOS]
)
