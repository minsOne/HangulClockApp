//
//  SettingsViewController.swift
//  Settings
//
//  Created by minsone on 2020/02/09.
//  Copyright © 2020 minsone. All rights reserved.
//

import RIBs
import RxSwift
import UIKit
import SwiftUI
import Resource

public protocol SettingsPresentableListener: class {
    func finishSettings()
    func select(themeColor: R.Color)
}

final class SettingsViewController: SettingsPresentable, SettingsViewControllable, ViewStateListener {
    var uiviewController: UIViewController {
        return hostingController
    }
    
    weak var listener: SettingsPresentableListener?
    
    private let hostingController: UIHostingController<SettingsView>
    
    var viewState: SettingsViewState
    
    init(viewState: SettingsViewState) {
        let rootView = SettingsView(state: viewState)
        self.viewState = viewState
        self.hostingController = UIHostingController(rootView: rootView)
        self.viewState.listener = self
    }
    
    func onDisappear() {
        listener?.finishSettings()
    }
    
    func select(themeColor: R.Color) {
        listener?.select(themeColor: themeColor)
    }
}
