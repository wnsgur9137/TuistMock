//
//  Path.swift
//  MyPlugin
//
//  Created by JunHyeok Lee on 3/4/24.
//

import Foundation
import ProjectDescription

public extension ProjectDescription.Path {
    static func relativeToCarthage(_ path: String) -> Self {
        return .relativeToRoot("Tuist/Dependencies/Carthage/Build/\(path)")
    }
    static func relativeToXCConfig(_ scheme: AppConfiguration, path: String) -> Self {
        return .relativeToRoot("XCConfig/\(path)/\(scheme.rawValue).xcconfig")
    }
    static func relativeToXCConfig(name: String, path: String) -> Self {
        return .relativeToRoot("XCConfig/\(path)/\(name).xcconfig")
    }
    static func relativeToXCConfig(_ scheme: AppConfiguration) -> Self {
        return .relativeToRoot("XCConfig/\(scheme.rawValue).xcconfig")
    }
    static func relativeToProject(name: String) -> Self {
        return .relativeToRoot("Projects/\(name)")
    }
    static func relative(to layer: ProjectLayer) -> Self {
        return .relativeToRoot("Projects/\(layer.rawValue)/\(layer.rawValue)")
    }
    static func relative(to layer: ProjectLayer, name: String) -> Self {
        return .relativeToRoot("Projects/\(layer.rawValue)/\(name)")
    }
}
