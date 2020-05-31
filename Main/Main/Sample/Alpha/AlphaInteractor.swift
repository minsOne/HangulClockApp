//
//  AlphaInteractor.swift
//  Main
//
//  Created by minsone on 2020/05/31.
//  Copyright © 2020 minsone. All rights reserved.
//

import RIBs
import RxSwift

protocol AlphaRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
    func beta()
}

protocol AlphaPresentable: Presentable {
    var listener: AlphaPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol AlphaListener: class {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class AlphaInteractor: PresentableInteractor<AlphaPresentable>, AlphaInteractable, AlphaPresentableListener {

    weak var router: AlphaRouting?
    weak var listener: AlphaListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: AlphaPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
        router?.beta()
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
}
