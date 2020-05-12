//
//  SettingsInteractor.swift
//  Settings
//
//  Created by minsone on 2020/02/09.
//  Copyright © 2020 minsone. All rights reserved.
//

import RIBs
import RxSwift
import Resource
import UIKit

public protocol SettingsRouting: ViewableRouting {}

public protocol SettingsPresentable: Presentable {
    var listener: SettingsPresentableListener? { get set }
}

public protocol SettingsListener: class {
    func finishSettings()
    func updateBackgroundColor(color: UIColor)
}

final class SettingsInteractor: PresentableInteractor<SettingsPresentable>, SettingsInteractable, SettingsPresentableListener {
    weak var router: SettingsRouting?
    weak var listener: SettingsListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: SettingsPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
    
    func finishSettings() {
        listener?.finishSettings()
    }
    
    func select(themeColor color: R.Color) {
        listener?.updateBackgroundColor(color: color.color)
        R.ThemeColor.saveColor(color)
    }
}
