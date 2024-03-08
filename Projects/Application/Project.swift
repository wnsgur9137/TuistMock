//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by JunHyeok Lee on 3/4/24.
//

import Foundation
import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let projectName = "TuistMock"
let organizationName = "com.junhyeok.TuistMock"
let deploymentTarget: DeploymentTargets = .iOS("14.0")
let defaultInfoPlist: [String: Plist.Value] = [
    "UILaunchStoryboardName": "LaunchScreen",
    "UIApplicationSceneManifest": [
        "UIApplicationSupportsMultipleScenes": false,
        "UISceneConfigurations": [
            "UIWindowSceneSessionRoleApplication": [
                [
                    "UISceneConfigurationName": "Default Configuration",
                    "UISceneDelegateClassName": "$(PRODUCT_MODULE_NAME).SceneDelegate"
                ]
            ]
        ]
    ],
    "NSAppTransportSecurity": [
        "NSAllowsArbitraryLoads": true
    ]
]

// MARK: - Settings
let settings: Settings = .settings(
    base: [
        "CODE_SIGN_IDENTITY": "",
        "CODE_SIGNING_REQUIRED": "NO",
    ],
    configurations: [
        .debug(name: .DEV),
        .debug(name: .TEST),
        .release(name: .PROD)
    ]
)

// MARK: - Scripts
let scripts: [TargetScript] = [

]

// MARK: - Targets
let targets: [Target] = [
    Target(
        name: projectName,
        destinations: .iOS,
        product: .app,
        productName: projectName,
        bundleId: organizationName,
        deploymentTargets: deploymentTarget,
        infoPlist: .extendingDefault(with: defaultInfoPlist),
        sources: .sources,
        resources: .resources,
        scripts: scripts,
        dependencies: [
            .Project.TabBar,
            .Project.InjectManager.Repository
        ],
        settings: .settings(
            configurations: [
                .debug(
                    name: .DEV,
                    settings: [
                        "ASSETCATALOG_COMPILER_APPICON_NAME": "AppIconDevServer",
                        "GCC_PREPROCESSOR_DEFINITIONS": ["FLEXLAYOUT_SWIFT_PACKAGE=1"]
                    ],
                    xcconfig: XCConfig.Application.app(.DEV)
                ),
                .release(
                    name: .PROD,
                    settings: [
                        "SWIFT_ACTIVE_COMPILATION_CONDITIONS": "RELEASE",
                        "ASSETCATALOG_COMPILER_APPICON_NAME": "AppIcon",
                        "GCC_PREPROCESSOR_DEFINITIONS": ["FLEXLAYOUT_SWIFT_PACKAGE=1"]
                    ],
                    xcconfig: XCConfig.Application.app(.PROD)
                )
            ]
        )
    ),
    Target(
        name: "\(projectName)_DevApp",
        destinations: .iOS,
        product: .app,
        productName: "\(projectName)_DevApp",
        bundleId: "com.junhyeok.dev-\(projectName)",
        deploymentTargets: deploymentTarget,
        infoPlist: .extendingDefault(with: defaultInfoPlist),
        sources: ["Sources/**", "DevSources"],
        resources: ["Resources/**"],
        scripts: scripts,
        dependencies: [
            .Project.TabBar,
            .Project.InjectManager.Repository
        ],
        settings: .settings(
            configurations: [
                .debug(
                    name: .DEV,
                    settings: [
                        "ASSETCATALOG_COMPILER_APPICON_NAME": "AppIconDevServer",
                        "GCC_PREPROCESSOR_DEFINITIONS": ["FLEXLAYOUT_SWIFT_PACKAGE=1"]
                    ],
                    xcconfig: XCConfig.Application.devApp(.DEV)
                ),
                .release(
                    name: .PROD,
                    settings: [
                        "SWIFT_ACTIVE_COMPILATION_CONDITIONS": "RELEASE",
                        "ASSETCATALOG_COMPILER_APPICON_NAME": "AppIcon",
                        "GCC_PREPROCESSOR_DEFINITIONS": ["FLEXLAYOUT_SWIFT_PACKAGE=1"]
                    ],
                    xcconfig: XCConfig.Application.devApp(.PROD)
                )
            ]
        )
    ),
    Target(
        name: "\(projectName)_DevAppTests",
        destinations: .iOS,
        product: .unitTests,
        productName: "\(projectName)_DevAppTest",
        bundleId: "com.junhyeok.dev-PillInformationTest",
        deploymentTargets: deploymentTarget,
        infoPlist: .default,
        sources: "Tests/**",
        dependencies: [
            .target(name: "\(projectName)_DevApp")
        ],
        settings: .settings(
            configurations: [
                .debug(
                    name: .TEST,
                    settings: [
                        "OTHER_LDFLAGS": "$(inherited) -Xlinker -"
                    ],
                    xcconfig: XCConfig.Application.devApp(.TEST)
                ),
                .debug(
                    name: .TEST,
                    settings: [
                        "OTHER_LDFLAGS": "$(inherited) -Xlinker -interposable -all_load"
                    ],
                    xcconfig: XCConfig.Application.app(.TEST)
                ),
            ]
        )
    )
]

// MARK: - Schemes
let schemes: [Scheme] = [
    Scheme(
        name: "\(projectName)_DevApp-Prod",
        shared: true,
        buildAction: .buildAction(targets: ["\(projectName)"]),
        testAction: nil,
        runAction: .runAction(configuration: .PROD),
        archiveAction: .archiveAction(configuration: .PROD),
        profileAction: .profileAction(configuration: .PROD),
        analyzeAction: .analyzeAction(configuration: .PROD)
    ),
    Scheme(
        name: "\(projectName)_DevApp-Develop",
        shared: true,
        buildAction: .buildAction(targets: ["\(projectName)_DevApp"]),
        testAction: .targets(
            ["\(projectName)_DevAppTests"],
            configuration: .DEV,
            options: .options(coverage: true)
        ),
        runAction: .runAction(configuration: .DEV),
        archiveAction: .archiveAction(configuration: .DEV),
        profileAction: .profileAction(configuration: .DEV),
        analyzeAction: .analyzeAction(configuration: .DEV)
    )
]

// MARK: - Project
let project: Project = .init(
    name: "Application",
    organizationName: organizationName,
    settings: settings,
    targets: targets,
    schemes: schemes,
    additionalFiles: [
        "//XCConfig/Application/Application-\(AppConfiguration.SHARED).xcconfig"
    ]
)
