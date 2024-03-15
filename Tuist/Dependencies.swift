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
            .github(path: "https://github.com/layoutBox/PinLayout.git", requirement: .branch("master")),
        ],
    swiftPackageManager: SwiftPackageManagerDependencies(
        [
            .remote(url: "https://github.com/ReactiveX/RxSwift.git", requirement: .upToNextMajor(from: "6.6.0")),
            .remote(url: "https://github.com/RxSwiftCommunity/RxGesture.git", requirement: .upToNextMajor(from: "4.0.0")),
            .remote(url: "https://github.com/ReactorKit/ReactorKit.git", requirement: .branch("master")),
            .remote(url: "https://github.com/RxSwiftCommunity/RxGesture", requirement: .upToNextMajor(from: "4.0.0")),
            .remote(url: "https://github.com/Alamofire/Alamofire", requirement: .upToNextMajor(from: "5.0.0")),
            .remote(url: "https://github.com/Moya/Moya", requirement: .upToNextMajor(from: "15.0.0")),
        ],
        productTypes: [
//            "ReactorKit": .framework,
//            "WeakMapTable": .framework,
//            "ReactorKitRuntime": .framework,
//            "RxGesture": .framework,
            "RxCocoaRuntime": .framework,
        ]
    ),
    platforms: [.iOS]
)
