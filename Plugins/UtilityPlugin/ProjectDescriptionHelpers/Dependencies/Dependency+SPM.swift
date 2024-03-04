//
//  Dependency+SPM.swift
//  MyPlugin
//
//  Created by JunHyeok Lee on 3/4/24.
//

import Foundation
import ProjectDescription

extension TargetDependency {
    public struct SwiftPM {
        public struct Network { }
        public struct Reactive { }
        public struct Layout { }
        public struct UI { }
        public struct Test { }
    }
}
extension Package {
    public struct Network { }
    public struct Reactive { }
    public struct Layout { }
    public struct UI { }
    public struct Test { }
}

public extension TargetDependency.SwiftPM.Network {
    static let Moya: TargetDependency = .package(product: "RxMoya")
}
public extension TargetDependency.SwiftPM.Reactive {
    static let RxSwift: TargetDependency = .package(product: "RxSwift")
    static let RxCocoa: TargetDependency = .package(product: "RxCocoa")
    static let RxGesture: TargetDependency = .package(product: "RxGesture")
    static let reactorKit: TargetDependency = .package(product: "ReactorKit")
}
public extension TargetDependency.SwiftPM.Layout {
    
}
public extension TargetDependency.SwiftPM.UI {
    
}
public extension TargetDependency.SwiftPM.Test {
    
}

public extension Package.Network {
    static let alamofire: Package = .package(url: "https://github.com/Alamofire/Alamofire", .upToNextMajor(from: "5.0.0"))
    static let moya: Package = .package(url: "https://github.com/Moya/Moya", .upToNextMajor(from: "15.0.0"))
    static let package: [Package] = [alamofire, moya]
}
public extension Package.Reactive {
    static let rxSwift: Package = .package(url: "https://github.com/ReactiveX/RxSwift", .upToNextMajor(from: "6.0.0"))
    static let rxGesture: Package = .package(url: "https://github.com/RxSwiftCommunity/RxGesture", .upToNextMajor(from: "4.0.0"))
    static let reactorKit: Package = .package(url: "https://github.com/ReactorKit/ReactorKit", .upToNextMajor(from: "3.0.0"))
    static let package: [Package] = [rxSwift, rxGesture, reactorKit]
}
public extension Package.Layout {
    
}
public extension Package.UI {
    
}
public extension Package.Test {
    
}
