//
//  HomeUseCase.swift
//  HomeDomain
//
//  Created by JunHyeok Lee on 3/5/24.
//  Copyright © 2024 com.junhyeok.TuistMock. All rights reserved.
//

import Foundation
import RxSwift

import HomePresentation

public final class DefaultHomeUseCase: HomeUseCase {
    private let homeRepository: HomeRepository
    
    public init(with repository: HomeRepository) {
        self.homeRepository = repository
    }
}

extension DefaultHomeUseCase {
    public func executeTestData() -> Single<TestDataViewModel> {
        return homeRepository.executeTestData().map { testData in
            return testData.toViewModel()
        }
    }
}
