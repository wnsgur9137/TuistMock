//
//  Dependency+Carthage.swift
//  UtilityPlugin
//
//  Created by JunHyeok Lee on 3/7/24.
//

import Foundation
import ProjectDescription

public extension TargetDependency {
    struct Carthage {
        public struct Reactive { }
        public struct Layout { }
        public struct UI { }
        public struct Test { }
    }
}

public extension TargetDependency.Carthage.Reactive {
    static let RxSwift: TargetDependency = .carthage(name: "RxSwift")
    static let RxCocoa: TargetDependency = .carthage(name: "RxCocoa")
    static let RxGesture: TargetDependency = .carthage(name: "RxGesture")
    static let All: [TargetDependency] = [RxSwift, RxCocoa, RxGesture]
}

public extension TargetDependency.Carthage.Layout {
    static let FlexLayout: TargetDependency = .carthage(name: "FlexLayout")
    static let PinLayout: TargetDependency = .carthage(name: "PinLayout")
    static let All: [TargetDependency] = [FlexLayout, PinLayout]
}

public extension TargetDependency {
    static func carthage(name: String) -> Self {
        return .xcframework(path: .relativeToCarthage("\(name).xcframework"))
    }
}
