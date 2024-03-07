//
//  HomeUseCase.swift
//  HomePresentation
//
//  Created by JunHyeok Lee on 3/7/24.
//  Copyright © 2024 com.junhyeok.TuistMock. All rights reserved.
//

import Foundation
import RxSwift

public protocol HomeUseCase {
    func executeTestData() -> Single<TestDataViewModel>
}
