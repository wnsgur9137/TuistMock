//
//  HomeCoordinator.swift
//  HomePresentation
//
//  Created by JunHyeok Lee on 3/5/24.
//  Copyright © 2024 com.junhyeok.TuistMock. All rights reserved.
//

import UIKit

import Common

public protocol HomeCoordinatorDependencies {
    func makeHomeViewController(flowAction: HomeFlowAction) -> HomeViewController
}

public protocol HomeTabDependencies {
    
}

public protocol HomeCoordinator: Coordinator {
    func showHomeViewController()
}

public final class DefaultHomeCoordinator: HomeCoordinator {
    public weak var finishDelegate: CoordinatorFinishDelegate?
    public weak var navigationController: UINavigationController?
    public var childCoordinators: [Coordinator] = []
    public var type: CoordinatorType { .home }
    
    private let dependencies: HomeCoordinatorDependencies
    private let tabDependencies: HomeTabDependencies
    
    private weak var homeViewController: HomeViewController?
    
    public init(navigationController: UINavigationController? = nil,
                dependencies: HomeCoordinatorDependencies,
                tabDependencies: HomeTabDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
        self.tabDependencies = tabDependencies
    }
    
    public func start() {
        
    }
    
    public func showHomeViewController() {
        let flowAction = HomeFlowAction()
        let viewController = dependencies.makeHomeViewController(flowAction: flowAction)
        homeViewController = viewController
    }
}
