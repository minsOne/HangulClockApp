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
    
    init(bgColor: UIColor) {
        self._state = state.value
        let conf = Configure()
        let rootView = MainView(size: conf.rootViewSize, state: __state)
        self.hostingController = UIHostingController(rootView: rootView)
        _state.listener = self
        hostingController.view.backgroundColor = bgColor
        addPanGesuture()
    }
    
    @objc required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateBackgroundColor(_ color: UIColor) {
        hostingController.view.backgroundColor = color
    }
    
    private var lastTranslation: CGPoint?
    
    func addPanGesuture() {
        let selector = #selector(displayGestureForPanGestureRecognizer)
        let pan = UIPanGestureRecognizer( target: self, action: selector)
        hostingController.view.addGestureRecognizer(pan)
    }
    
    @objc func displayGestureForPanGestureRecognizer(sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: hostingController.view)
        
        switch sender.state {
        case .began:
            lastTranslation = translation
        case .changed:
            changeViewAlpha(nowPoint: translation)
        case .cancelled, .ended, .failed, .possible:
            fallthrough
        default:
            lastTranslation = nil
        }
    }
    
    func changeViewAlpha(nowPoint: CGPoint) {
        defer { lastTranslation = nowPoint }
        
        guard
            let lastPoint = lastTranslation,
            case let alpha = hostingController.view.alpha
            else { return }
        
        if lastPoint.y > nowPoint.y && alpha < 1.0 {
            hostingController.view.alpha = alpha + 0.01
        } else if lastPoint.y < nowPoint.y && alpha >= 0.02 {
            hostingController.view.alpha = alpha - 0.01
        }
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
        print(#file, #function)
        listener?.request(action: .settings)
    }
    
    func onAppear() {
        print(#file, #function)
    }
}

private struct Configure {
    var rootViewSize: CGSize {
        let size = UIScreen.main.bounds.size
        let value = min(size.width - 20, size.height - 20)
        return CGSize(value, value)
    }
}
