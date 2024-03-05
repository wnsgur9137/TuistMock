//
//  HomeRepository.swift
//  HomeDomain
//
//  Created by JunHyeok Lee on 3/5/24.
//  Copyright © 2024 com.junhyeok.TuistMock. All rights reserved.
//

import Foundation
import RxSwift

public protocol HomeRepository {
    func executeTestData() -> Single<TestData>
}
