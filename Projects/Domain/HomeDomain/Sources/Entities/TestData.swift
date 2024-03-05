//
//  TestData.swift
//  HomeDomain
//
//  Created by JunHyeok Lee on 3/5/24.
//  Copyright © 2024 com.junhyeok.TuistMock. All rights reserved.
//

import Foundation

public struct TestData {
    let title: String
    let content: String
    let id: Int
    
    public init(title: String, content: String, id: Int) {
        self.title = title
        self.content = content
        self.id = id
    }
}
