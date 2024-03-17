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
    case InjectManager
    case Feature
    case Presentation
    case Domain
    case Data
    case Infrastructure
    case LibraryManager
}

extension TargetDependency {
    public struct Project {
        public struct InjectManager { }
        public struct Feature {
            public struct Presentation { }
            public struct Domain { }
            public struct Data { }
        }
        public struct Infrastructure { }
        public struct LibraryManager { }
    }
}

// MARK: - Project
public extension TargetDependency.Project {
    static let TabBar: TargetDependency = .project(target: "TabBar", path: .relativeToProject(name: "TabBar"))
    static let Common: TargetDependency = .project(target: "Common", path: .relativeToProject(name: "Common"))
}

// MARK: - InjectManager
public extension TargetDependency.Project.InjectManager {
    static let Repository: TargetDependency = .project(layer: .InjectManager, name: "RepositoryInjectManager")
}

// MARK: - Feature
public extension TargetDependency.Project.Feature {
    static let Features: TargetDependency = .project(layer: .Feature, name: "Features")
    static let Home: TargetDependency = .project(layer: .Feature, name: "Home")
    static let Search: TargetDependency = .project(layer: .Feature, name: "Search")
    static let Setting: TargetDependency = .project(layer: .Feature, name: "Setting")
}

// MARK: - Presentation
public extension TargetDependency.Project.Feature.Presentation {
    static let Base: TargetDependency = .project(layer: .Presentation, name: "BasePresentation")
    static let Home: TargetDependency = .project(layer: .Presentation, name: "HomePresentation")
    static let Search: TargetDependency = .project(layer: .Presentation, name: "SearchPresentation")
    static let Setting: TargetDependency = .project(layer: .Presentation, name: "SettingPresentation")
}

// MARK: - Domain
public extension TargetDependency.Project.Feature.Domain {
    static let Home: TargetDependency = .project(layer: .Domain, name: "HomeDomain")
    static let Search: TargetDependency = .project(layer: .Domain, name: "SearchDomain")
    static let Setting: TargetDependency = .project(layer: .Domain, name: "SettingDomain")
}

// MARK: - Data
public extension TargetDependency.Project.Feature.Data {
    static let Base: TargetDependency = .project(layer: .Data, name: "BaseData")
    static let Home: TargetDependency = .project(layer: .Data, name: "HomeData")
    static let Search: TargetDependency = .project(layer: .Data, name: "SearchData")
    static let Setting: TargetDependency = .project(layer: .Data, name: "SettingData")
}

// MARK: - InfraStructure
public extension TargetDependency.Project.Infrastructure {
    static let Network: TargetDependency = .project(layer: .Infrastructure, name: "Network")
    static let Service: TargetDependency = .project(layer: .Infrastructure, name: "Service")
}

// MARK: - Library
public extension TargetDependency.Project.LibraryManager {
    static let Network: TargetDependency = .project(layer: .LibraryManager, name: "NetworkLibraries")
    static let Reactive: TargetDependency = .project(layer: .LibraryManager, name: "ReactiveLibraries")
    static let Layout: TargetDependency = .project(layer: .LibraryManager, name: "LayoutLibraries")
    static let UI: TargetDependency = .project(layer: .LibraryManager, name: "UILibraries")
}

// MARK: - TargetDependency
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

// MARK: - SourceFile
public extension SourceFilesList {
    static let sources: SourceFilesList = "Sources/**"
    static let tests: SourceFilesList = "Tests/**"
}

// MARK: - Resource
public extension ResourceFileElements {
    static let resources: ResourceFileElements = "Resources/**"
}
public extension ResourceFileElement {
    static let xibs: ResourceFileElement = "Sources/**/*.xib"
    static let storyboards: ResourceFileElement = "Resources/**/*.storyboard"
}
