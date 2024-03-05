//
//  TabBarCoordinator.swift
//  TabBar
//
//  Created by JunHyeok Lee on 3/5/24.
//  Copyright © 2024 com.junhyeok.TuistMock. All rights reserved.
//

import UIKit

import Common
import HomePresentation
import SearchPresentation
import SettingPresentation

public protocol TabBarCoordinator: Coordinator {
    var tabBarController: UITabBarController? { get set }
}

public final class DefaultTabBarCoordinator: TabBarCoordinator {
    public weak var finishDelegate: CoordinatorFinishDelegate?
    public weak var navigationController: UINavigationController?
    
    public var childCoordinators: [Coordinator] = []
    public var type: CoordinatorType { .tab }
    
    private let homeDependencies: HomeCoordinatorDependencies
    
    public weak var tabBarController: UITabBarController?
    private weak var homeViewController: HomeViewController?
    
    public init(tabBarController: UITabBarController,
                homeDependencies: HomeCoordinatorDependencies) {
        self.tabBarController = tabBarController
        self.homeDependencies = homeDependencies
    }
    
    public func start() {
        let pages: [TabBarPage] = [.home, .search, .setting]
        let controllers: [UINavigationController] = pages.map { getNavigationController($0) }
        prepareTabBarController(with: controllers)
    }
    
    private func getNavigationController(_ page: TabBarPage) -> UINavigationController {
        let navigationController = UINavigationController()
        navigationController.tabBarItem = UITabBarItem(
            title: page.title(),
            image: page.image(),
            selectedImage: page.selectedImage()
        )
        navigationController.setNavigationBarHidden(true, animated: false)
        
        switch page {
        case .home: 
            let homeCoordinator = DefaultHomeCoordinator(
                dependencies: homeDependencies,
                tabDependencies: self)
            homeCoordinator.finishDelegate = self
            homeCoordinator.start()
            childCoordinators.append(homeCoordinator)
            
        case .search: break
        case .setting: break
        }
        return navigationController
    }
    
    private func prepareTabBarController(with controllers: [UINavigationController]) {
        tabBarController?.setViewControllers(controllers, animated: true)
        tabBarController?.selectedIndex = TabBarPage.home.orderNumber()
        tabBarController?.tabBar.isTranslucent = false
        tabBarController?.tabBar.barTintColor = .systemBackground
        tabBarController?.view.backgroundColor = .systemBackground
    }
}

extension DefaultTabBarCoordinator: CoordinatorFinishDelegate {
    public func coordinatorDidFinish(childCoordinator: Coordinator) {
        childCoordinators = childCoordinators.filter { $0.type != childCoordinator.type }
        navigationController?.viewControllers.removeAll()
    }
}

extension DefaultTabBarCoordinator: HomeTabDependencies {
    
}
