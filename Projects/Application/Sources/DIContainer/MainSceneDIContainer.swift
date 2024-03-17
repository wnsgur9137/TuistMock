//
//  MainSceneDIContainer.swift
//  TuistMock
//
//  Created by JunHyeok Lee on 3/5/24.
//  Copyright © 2024 com.junhyeok.TuistMock. All rights reserved.
//

import UIKit
import RxSwift

import TabBar
import HomeData
import HomeDomain
import HomePresentation

final class MainSceneDIContainer {
    struct Dependencies {
        
    }
    
    let dependencies: Dependencies
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    func makeTabBarCoordinator(tabBarController: UITabBarController) -> TabBarCoordinator {
        return DefaultTabBarCoordinator(
            tabBarController: tabBarController,
            homeDependencies: self
        )
    }
}

extension MainSceneDIContainer: HomeCoordinatorDependencies {
    func makeHomeRepository() -> HomeDomain.HomeRepository {
        return HomeData.DefaultHomeRepository()
    }
    
    func makeHomeUseCase() -> HomeDomain.HomeUseCase {
        return DefaultHomeUseCase(with: makeHomeRepository())
    }
    
    func makeHomeReactor(flowAction: HomeFlowAction) -> HomePresentation.HomeReactor {
        return HomeReactor(with: makeHomeUseCase(),
                           flowAction: flowAction)
    }
    
    func makeHomeViewController(flowAction: HomeFlowAction) -> HomePresentation.HomeViewController {
        return HomeViewController.create(with: makeHomeReactor(flowAction: flowAction))
    }
    
    
}
