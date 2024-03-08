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

// MARK: - Network Target
public extension TargetDependency.SwiftPM.Network {
    static let Moya: TargetDependency = .package(product: "RxMoya")
    static let All: [TargetDependency] = [Moya]
}

// MARK: - Reactive Target
public extension TargetDependency.SwiftPM.Reactive {
//    static let RxSwift: TargetDependency = .package(product: "RxSwift")
//    static let RxCocoa: TargetDependency = .package(product: "RxCocoa")
    static let RxSwift: TargetDependency = .external(name: "RxSwift")
    static let RxCocoa: TargetDependency = .external(name: "RxCocoa")
    static let RxGesture: TargetDependency = .package(product: "RxGesture")
    static let ReactorKit: TargetDependency = .package(product: "ReactorKit")
    static let All: [TargetDependency] = [RxSwift, RxCocoa, RxGesture, ReactorKit]
}

// MARK: - Layout Target
public extension TargetDependency.SwiftPM.Layout {
//    static let FlexLayout: TargetDependency = .package(product: "FlexLayout")
//    static let PinLayout: TargetDependency = .package(product: "PinLayout")
    static let FlexLayout: TargetDependency = .external(name: "FlexLayout")
    static let PinLayout: TargetDependency = .external(name: "PinLayout")
    static let All: [TargetDependency] = [FlexLayout, PinLayout]
}

// MARK: - UI Target
public extension TargetDependency.SwiftPM.UI {
    static let SkeletonView: TargetDependency = .package(product: "SkeletonView")
    static let KingFisher: TargetDependency = .package(product: "Kingfisher")
    static let DropDown: TargetDependency = .package(product: "DropDown")
    static let All: [TargetDependency] = [SkeletonView, KingFisher, DropDown]
}

// MARK: - Test Target
public extension TargetDependency.SwiftPM.Test {
    static let RxBlocking: TargetDependency = .package(product: "RxBlocking")
    static let RxTest: TargetDependency = .package(product: "RxTest")
    static let All: [TargetDependency] = [RxBlocking, RxTest]
}

// MARK: - Network Package
public extension Package.Network {
    static let Alamofire: Package = .package(url: "https://github.com/Alamofire/Alamofire", .upToNextMajor(from: "5.0.0"))
    static let Moya: Package = .package(url: "https://github.com/Moya/Moya", .upToNextMajor(from: "15.0.0"))
    static let All: [Package] = [Alamofire, Moya]
}

// MARK: - Reative Package
public extension Package.Reactive {
    static let RxSwift: Package = .package(url: "https://github.com/ReactiveX/RxSwift", .upToNextMajor(from: "6.0.0"))
    static let RxGesture: Package = .package(url: "https://github.com/RxSwiftCommunity/RxGesture", .upToNextMajor(from: "4.0.0"))
    static let ReactorKit: Package = .package(url: "https://github.com/ReactorKit/ReactorKit", .upToNextMajor(from: "3.0.0"))
    static let All: [Package] = [RxSwift, RxGesture, ReactorKit]
}

// MARK: - Layout Package
public extension Package.Layout {
    static let FlexLayout: Package = .package(url: "https://github.com/layoutBox/FlexLayout", .branch("master"))
    static let PinLayout: Package = .package(url: "https://github.com/layoutBox/PinLayout", .branch("master"))
    static let All: [Package] = [FlexLayout, PinLayout]
}

// MARK: - UI Package
public extension Package.UI {
    static let SkeletonView: Package = .package(url: "https://github.com/Juanpe/SkeletonView", .upToNextMajor(from: "1.0.0"))
    static let KingFihser: Package = .package(url: "https://github.com/onevcat/Kingfisher", .upToNextMajor(from: "7.0.0"))
    static let DropDown: Package = .package(url: "https://github.com/AssistoLab/DropDown", .branch("master"))
    static let All: [Package] = [SkeletonView, KingFihser, DropDown]
}

// MARK: - Test Package
public extension Package.Test {
    static let All: [Package] = []
}
