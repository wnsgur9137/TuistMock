//
//  HomeViewController.swift
//  HomePresentation
//
//  Created by JunHyeok Lee on 3/5/24.
//  Copyright © 2024 com.junhyeok.TuistMock. All rights reserved.
//

import UIKit
import ReactorKit
import RxSwift
import RxCocoa
import FlexLayout
import PinLayout

import Common
import LayoutLibraries

public final class HomeViewController: UIViewController, View {
    
    private let flexRootContainerView = UIView()
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Home"
        label.textColor = .label
        label.font = .systemFont(ofSize: 36.0, weight: .bold)
        return label
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Button", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    
    public var disposeBag = DisposeBag()
    
    // MARK: - Lifecycle
    
    public static func create(with reactor: HomeReactor) -> HomeViewController {
        let viewController = HomeViewController()
        viewController.reactor = reactor
        return viewController
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupFlexLayout()
    }
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupPinLayout()
    }
}

// MARK: - Binding
extension HomeViewController {
    public func bind(reactor: HomeReactor) {
        bindAction(reactor)
        bindState(reactor)
    }
    
    private func bindAction(_ reactor: HomeReactor) {
        button.rx.tap
            .map { Reactor.Action.didTapButton }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
    }
    
    private func bindState(_ reactor: HomeReactor) {
        reactor.state
            .map { $0.testData }
            .bind(onNext: { testData in
                print("isLoadedTestData: \(testData)")
            })
            .disposed(by: disposeBag)
    }
}

// MARK: - Layout
extension HomeViewController {
    private func setupFlexLayout() {
        view.addSubview(flexRootContainerView)
        flexRootContainerView.flex
            .justifyContent(.center)
            .define { rootView in
                rootView.addItem(label)
                rootView.addItem(button)
        }
    }
    
    private func setupPinLayout() {
        flexRootContainerView.pin.all()
        flexRootContainerView.flex.layout()
    }
}
