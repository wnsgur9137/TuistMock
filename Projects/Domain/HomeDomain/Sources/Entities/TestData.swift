//
//  TestData.swift
//  HomeDomain
//
//  Created by JunHyeok Lee on 3/5/24.
//  Copyright © 2024 com.junhyeok.TuistMock. All rights reserved.
//

import Foundation
import HomePresentation

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

extension TestData {
    func toViewModel() -> TestDataViewModel {
        return .init(title: self.title, content: self.content, id: self.id)
    }
}
