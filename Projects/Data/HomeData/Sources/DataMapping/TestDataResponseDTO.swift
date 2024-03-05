//
//  TestDataResponseDTO.swift
//  HomeData
//
//  Created by JunHyeok Lee on 3/5/24.
//  Copyright © 2024 com.junhyeok.TuistMock. All rights reserved.
//

import Foundation
import HomeDomain

public struct TestDataResponseDTO: Decodable {
    let title: String
    let content: String
    let id: Int
}

extension TestDataResponseDTO {
    func toDomain() -> TestData {
        return .init(title: self.title, content: self.content, id: self.id)
    }
}
