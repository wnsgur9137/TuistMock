//
//  TabBarPage.swift
//  TabBar
//
//  Created by JunHyeok Lee on 3/5/24.
//  Copyright © 2024 com.junhyeok.TuistMock. All rights reserved.
//

import UIKit

enum TabBarPage {
    case home
    case search
    case setting
    
    init?(index: Int) {
        switch index {
        case 0: self = .home
        case 1: self = .search
        case 2: self = .setting
        default: return nil
        }
    }
    
    func title() -> String {
        switch self {
        case .home: return "Home"
        case .search: return "Search"
        case .setting: return "Setting"
        }
    }
    
    func orderNumber() -> Int {
        switch self {
        case .home: return 0
        case .search: return 1
        case .setting: return 2
        }
    }
    
    func image() -> UIImage? {
        switch self {
        case .home: return nil
        case .search: return nil
        case .setting: return nil
        }
    }
    
    func selectedImage() -> UIImage? {
        switch self {
        case .home: return nil
        case .search: return nil
        case .setting: return nil
        }
    }
}
