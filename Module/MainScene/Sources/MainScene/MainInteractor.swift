//
//  MainInteractor.swift
//  Main
//
//  Created by minsone on 2020/02/07.
//  Copyright © 2020 minsone. All rights reserved.
//

import UIKit
import RIBs
import RxSwift
import RxRelay
import HangulClockTable

public protocol MainRouting: ViewableRouting {
    func routeToSettings()
    func detachSettings()
}

public protocol MainPresentable: Presentable {
    var listener: MainPresentableListener? { get set }
    var state: BehaviorRelay<ViewState> { get }
    func updateBackgroundColor(_ color: UIColor)
}

public protocol MainListener: class {}

final class MainInteractor: PresentableInteractor<MainPresentable>, MainInteractable, MainPresentableListener {
    weak var router: MainRouting?
    weak var listener: MainListener?

    init(presenter: MainPresentable,
         timeIntervalService: TimeIntervalServicable,
         dateFormatService: DateFormatServicable) {
        self.timeIntervalService = timeIntervalService
        self.dateFormatService = dateFormatService
        super.init(presenter: presenter)
        presenter.listener = self
        initialzieViewState()
    }
    
    func initialzieViewState() {
        let state = presenter.state.value
        state.gridTexts = HangulTable.texts
        state.gridMarks = HangulTable.marks
        presenter.state.accept(state)
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        
        timeIntervalService
            .publishTickTime(interval: .seconds(1))
            .withLatestFrom(presenter.state) { ($0, $1) }
            .map { (date, state) in
                state.updateDate(date: date)
                return state
        }
        .observeOn(MainScheduler.instance)
        .bind(to: presenter.state)
        .disposeOnDeactivate(interactor: self)
    }

    override func willResignActive() {
        super.willResignActive()
    }
    
    func request(action: MainPresentableAction) {
        switch action {
        case .settings: router?.routeToSettings()
        }
    }
    
    func finishSettings() {
        router?.detachSettings()
    }
    
    func updateBackgroundColor(color: UIColor) {
        presenter.updateBackgroundColor(color)
    }
    
    // MARK: Private
    private let timeIntervalService: TimeIntervalServicable
    private let dateFormatService: DateFormatServicable
}
