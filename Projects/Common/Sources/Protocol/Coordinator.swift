//
//  Coordinator.swift
//  Common
//
//  Created by JunHyeok Lee on 3/5/24.
//  Copyright © 2024 com.junhyeok.TuistMock. All rights reserved.
//

import UIKit

public enum CoordinatorType {
    case tab, home, search, alarm, myPage
}

public protocol Coordinator: AnyObject {
    var finishDelegate: CoordinatorFinishDelegate? { get set }
    var navigationController: UINavigationController? { get set }
    var childCoordinators: [Coordinator] { get set }
    var type: CoordinatorType { get }
    
    func start()
    func finish()
}

public extension Coordinator {
    func finish() {
        childCoordinators.removeAll()
        finishDelegate?.coordinatorDidFinish(childCoordinator: self)
    }
}

public protocol CoordinatorFinishDelegate: AnyObject {
    func coordinatorDidFinish(childCoordinator: Coordinator)
}
