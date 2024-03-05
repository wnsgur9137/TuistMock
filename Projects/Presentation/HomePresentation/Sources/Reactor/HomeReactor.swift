//
//  HomeReactor.swift
//  HomePresentation
//
//  Created by JunHyeok Lee on 3/5/24.
//  Copyright © 2024 com.junhyeok.TuistMock. All rights reserved.
//

import Foundation
import ReactorKit
import RxSwift
import RxCocoa
import HomeDomain

public struct HomeFlowAction {
    
}

public final class HomeReactor: Reactor {
    public enum Action {
        case didTapButton
    }
    
    public enum Mutation {
        case didloadTestData(TestData)
    }
    
    public struct State {
        var testData: TestData? = nil
    }
    
    public var initialState = State()
    public let flowAction: HomeFlowAction
    private let disposeBag = DisposeBag()
    private let useCase: HomeUseCase
    
    public init(with useCase: HomeUseCase,
                flowAction: HomeFlowAction) {
        self.useCase = useCase
        self.flowAction = flowAction
    }
    
    private func loadTestData() -> Observable<TestData> {
        return useCase.executeTestData().asObservable()
    }
}

// MARK: - React
extension HomeReactor {
    public func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .didTapButton:
            return loadTestData().map { .didloadTestData($0) }
        }
    }
    
    public func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        switch mutation {
        case let .didloadTestData(testData):
            state.testData = testData
        }
        return state
    }
}
