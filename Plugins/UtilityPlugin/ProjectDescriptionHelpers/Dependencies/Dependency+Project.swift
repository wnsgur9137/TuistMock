//
//  Dependency+Project.swift
//  MyPlugin
//
//  Created by JunHyeok Lee on 3/4/24.
//

import Foundation
import ProjectDescription

public enum ProjectLayer: String {
    case Application
    case Feature
    case Presentation
    case Domain
    case Data
    case LibraryManager
}

extension TargetDependency {
    public struct Project {
        public struct Feature {
            public struct Presentation { }
            public struct Domain { }
            public struct Data { }
        }
        public struct LibraryManager { }
    }
}

public extension TargetDependency.Project {
    
}

public extension TargetDependency.Project.Feature {
    static let Home: TargetDependency = .project(layer: .Feature, name: "Home")
    static let Search: TargetDependency = .project(layer: .Feature, name: "Search")
    static let Setting: TargetDependency = .project(layer: .Feature, name: "Setting")
}

public extension TargetDependency.Project.Feature.Presentation {
    static let Home: TargetDependency = .project(layer: .Presentation, name: "HomePresentation")
    static let Search: TargetDependency = .project(layer: .Presentation, name: "SearchPresentation")
    static let Setting: TargetDependency = .project(layer: .Presentation, name: "SettingPresentation")
}

public extension TargetDependency.Project.Feature.Domain {
    static let Home: TargetDependency = .project(layer: .Domain, name: "HomeDomain")
    static let Search: TargetDependency = .project(layer: .Domain, name: "SearchDomain")
    static let Setting: TargetDependency = .project(layer: .Domain, name: "SettingDomain")
}

public extension TargetDependency.Project.Feature.Data {
    static let Home: TargetDependency = .project(layer: .Data, name: "HomeData")
    static let Search: TargetDependency = .project(layer: .Data, name: "SearchData")
    static let Setting: TargetDependency = .project(layer: .Data, name: "SettingData")
}

public extension TargetDependency {
    static func project(layer: ProjectLayer) -> Self {
        return .project(target: layer.rawValue, path: .relative(to: layer))
    }
    static func project(layer: ProjectLayer, name: String) -> Self {
        return .project(target: name, path: .relative(to: layer, name: name))
    }
    static func project(name: String) -> Self {
        return .project(target: name, path: .relativeToProject(name: name))
    }
}
