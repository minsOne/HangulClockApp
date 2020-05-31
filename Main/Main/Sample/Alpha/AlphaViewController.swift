//
//  AlphaViewController.swift
//  Main
//
//  Created by minsone on 2020/05/31.
//  Copyright © 2020 minsone. All rights reserved.
//

import RIBs
import RxSwift
import UIKit

protocol AlphaPresentableListener: class {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class AlphaViewController: UIViewController, AlphaPresentable, AlphaViewControllable {

    weak var listener: AlphaPresentableListener?
}
