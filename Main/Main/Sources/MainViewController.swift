//
//  MainViewController.swift
//  Main
//
//  Created by minsone on 2020/02/07.
//  Copyright © 2020 minsone. All rights reserved.
//

import RIBs
import RxSwift
import RxRelay
import RxCocoa
import UIKit
import SwiftUI
import PureSwiftUI

public enum MainPresentableAction {
    case settings
}

public protocol MainPresentableListener: class {
    func request(action: MainPresentableAction)
}

final class MainViewController: MainPresentable, MainViewControllable, ViewStateListner {
    var uiviewController: UIViewController {
        return hostingController
    }
    
    weak var listener: MainPresentableListener?
    
    var state = BehaviorRelay<ViewState>(value: ViewState())
    @ObservedObject private var _state: ViewState

    private let disposeBag = DisposeBag()
    private let hostingController: UIHostingController<MainView>
    
    init() {
        self._state = state.value
        let conf = Configure()
        let rootView = MainView(size: conf.rootViewSize, model: __state)
        self.hostingController = UIHostingController(rootView: rootView)
        _state.listener = self
        hostingController.view.backgroundColor = .black
    }
    
    @objc required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - MainViewControllable
extension MainViewController {
    func present(viewController: ViewControllable) {
        self.uiviewController.present(viewController.uiviewController,
                                      animated: true,
                                      completion: nil)
    }
    
    func dismiss(viewController: ViewControllable) {
        viewController.uiviewController.dismiss(animated: true, completion: nil)
    }
}

// MARK: - ViewStateListner
extension MainViewController {
    func tapSettings() {
        listener?.request(action: .settings)
        print(#function)
    }
    
    func onAppear() {
        print(#function)
    }
}

private struct Configure {
    var rootViewSize: CGSize {
        let size = UIScreen.main.bounds.size
        let value = min(size.width - 20, size.height - 20)
        return CGSize(value, value)
    }
}
