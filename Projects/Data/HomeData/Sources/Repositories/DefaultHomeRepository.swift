//
//  DefaultHomeRepository.swift
//  HomeData
//
//  Created by JunHyeok Lee on 3/5/24.
//  Copyright © 2024 com.junhyeok.TuistMock. All rights reserved.
//

import Foundation
import RxSwift

import HomeDomain

public final class DefaultHomeRepository: HomeRepository {
    private let disposeBag = DisposeBag()
    
    public init() {
        
    }
}

extension DefaultHomeRepository {
    public func executeTestData() -> Single<TestData> {
        let data: Single<TestDataResponseDTO> = .just(.init(title: "Title", content: "TEST Content", id: 0))
        return data.map { testDataResponseDTO in
            return testDataResponseDTO.toDomain()
        }
    }
}
