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
    static let FlexLayout: TargetDependency = .carthage(name: "FlexLayout")
    static let PinLayout: TargetDependency = .carthage(name: "PinLayout")
    
    static let RxSwift: TargetDependency = .carthage(name: "RxSwift")
    static let RxCocoa: TargetDependency = .carthage(name: "RxCocoa")
    static let RxGesture: TargetDependency = .carthage(name: "RxGesture")
    static let ReactorKit: TargetDependency = .carthage(name: "ReactorKit")
    static let Moya: TargetDependency = .carthage(name: "Moya")
    static let Alamofire: TargetDependency = .carthage(name: "Alamofire")
}

public extension TargetDependency {
    static func carthage(name: String) -> Self {
        return .xcframework(path: .relativeToCarthage("\(name).xcframework"))
    }
}
