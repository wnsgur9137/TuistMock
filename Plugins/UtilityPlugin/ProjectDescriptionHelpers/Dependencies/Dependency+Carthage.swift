//
//  Dependency+Carthage.swift
//  UtilityPlugin
//
//  Created by JunHyeok Lee on 3/7/24.
//

import Foundation
import ProjectDescription

public extension TargetDependency {
    struct Carthage { }
}

public extension TargetDependency.Carthage {
    static let RxSwift: TargetDependency = .carthage(name: "RxSwift")
    static let RxCocoa: TargetDependency = .carthage(name: "RxCocoa")
}

public extension TargetDependency {
    static func carthage(name: String) -> Self {
        return .xcframework(path: .relativeToCarthage("\(name).xcframework"))
    }
}
