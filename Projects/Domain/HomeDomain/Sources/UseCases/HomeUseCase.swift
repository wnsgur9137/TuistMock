//
//  HomeUseCase.swift
//  HomeDomain
//
//  Created by JunHyeok Lee on 3/5/24.
//  Copyright © 2024 com.junhyeok.TuistMock. All rights reserved.
//

import Foundation
import RxSwift

public protocol HomeUseCase {
    func executeTestData() -> Single<TestData>
}

public final class DefaultHomeUseCase: HomeUseCase {
    private let homeRepository: HomeRepository
    
    public init(with repository: HomeRepository) {
        self.homeRepository = repository
    }
}

extension DefaultHomeUseCase {
    public func executeTestData() -> Single<TestData> {
        return homeRepository.executeTestData()
    }
}
