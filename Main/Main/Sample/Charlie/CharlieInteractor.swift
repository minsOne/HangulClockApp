//
//  CharlieInteractor.swift
//  Main
//
//  Created by minsone on 2020/05/31.
//  Copyright © 2020 minsone. All rights reserved.
//

import RIBs
import RxSwift

protocol CharlieRouting: Routing {
    func cleanupViews()
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol CharlieListener: class {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class CharlieInteractor: Interactor, CharlieInteractable {

    weak var router: CharlieRouting?
    weak var listener: CharlieListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init() {}

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
    }

    override func willResignActive() {
        super.willResignActive()

        router?.cleanupViews()
        // TODO: Pause any business logic.
    }
}
