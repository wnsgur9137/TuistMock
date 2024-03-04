//
//  XCConfig.swift
//  UtilityPlugin
//
//  Created by JunHyeok Lee on 3/4/24.
//

import Foundation
import ProjectDescription

public struct XCConfig { }

public extension XCConfig {
    enum Application {
        public static func app(_ configuration: AppConfiguration) -> Path {
            "//XCConfig/Application/Application-\(configuration.rawValue).xcconfig"
        }
        public static func devApp(_ configuration: AppConfiguration) -> Path {
            "//XCConfig/Application/Application-\(configuration.rawValue).xcconfig"
        }
        public static func xcconfig(_ configuration: AppConfiguration) -> Path {
            "//XCConfig/\(configuration.rawValue).xcconfig"
        }
    }
}
