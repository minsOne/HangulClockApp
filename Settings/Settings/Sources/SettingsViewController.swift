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
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class SettingsViewController: UIViewController, SettingsPresentable, SettingsViewControllable {

    weak var listener: SettingsPresentableListener?
}
