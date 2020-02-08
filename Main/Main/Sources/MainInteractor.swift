//
//  MainInteractor.swift
//  Main
//
//  Created by minsone on 2020/02/07.
//  Copyright © 2020 minsone. All rights reserved.
//

import RIBs
import RxSwift
import RxRelay

public protocol MainRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

public protocol MainPresentable: Presentable {
    var listener: MainPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
    
    var state: BehaviorRelay<ViewState> { get }
}

public protocol MainListener: class {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class MainInteractor: PresentableInteractor<MainPresentable>, MainInteractable, MainPresentableListener {

    weak var router: MainRouting?
    weak var listener: MainListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    init(presenter: MainPresentable,
         timeIntervalService: TimeIntervalServicable,
         dateFormatService: DateFormatServicable) {
        self.timeIntervalService = timeIntervalService
        self.dateFormatService = dateFormatService
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        
        timeIntervalService
            .publishTickTime(interval: .seconds(1))
            .withLatestFrom(presenter.state) { ($0, $1) }
            .map { [dateFormatService] (date, state) -> ViewState in
                var new = state
                new.date = dateFormatService.date(date)
                return new
        }
        .debug()
        .observeOn(MainScheduler.instance)
        .bind(to: presenter.state)
        .disposeOnDeactivate(interactor: self)
    }

    override func willResignActive() {
        super.willResignActive()
    }
    
    // MARK: Private
    private let timeIntervalService: TimeIntervalServicable
    private let dateFormatService: DateFormatServicable
}
