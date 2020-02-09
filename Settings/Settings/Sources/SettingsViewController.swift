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

public protocol SettingsPresentableListener: class {
    func finishSettings()
}

final class SettingsViewController: UIViewController, SettingsPresentable, SettingsViewControllable {

    weak var listener: SettingsPresentableListener?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(#function)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

        guard isBeingDismissed || isMovingFromParent else { return }
        listener?.finishSettings()
    }
}
