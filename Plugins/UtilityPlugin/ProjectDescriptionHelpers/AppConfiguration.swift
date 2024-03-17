//
//  AppConfiguration.swift
//  MyPlugin
//
//  Created by JunHyeok Lee on 3/4/24.
//

import Foundation
import ProjectDescription

public enum AppConfiguration: String {
    case DEV
    case TEST
    case PROD
    case SHARED
    
    public var configurationName: ConfigurationName {
        .configuration(rawValue)
    }
}

public extension String {
    static var DEV: String { AppConfiguration.DEV.rawValue }
    static var TEST: String { AppConfiguration.TEST.rawValue }
    static var PROD: String { AppConfiguration.PROD.rawValue }
    static var SHARED: String { AppConfiguration.SHARED.rawValue }
}

public extension ConfigurationName {
    static var DEV: ConfigurationName { AppConfiguration.DEV.configurationName }
    static var TEST: ConfigurationName { AppConfiguration.TEST.configurationName }
    static var PROD: ConfigurationName { AppConfiguration.PROD.configurationName }
    static var SHARED: ConfigurationName { AppConfiguration.SHARED.configurationName }
}
