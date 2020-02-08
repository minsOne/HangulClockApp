//
//  TimeIntervalService.swift
//  Main
//
//  Created by minsone on 2020/02/08.
//  Copyright © 2020 minsone. All rights reserved.
//

import Foundation
import RxSwift

public protocol TimeIntervalServicable {
    func publishTickTime(interval: DispatchTimeInterval) -> Observable<Date>
}

struct TimeIntervalService: TimeIntervalServicable {
    func publishTickTime(interval: DispatchTimeInterval) -> Observable<Date> {
        let startDateStream = Observable.just(Date())
        let intervalStream = Observable<Int>.interval(interval,
                                                      scheduler: MainScheduler.instance)
            .map { _ in Date() }
        return Observable.concat([startDateStream, intervalStream])
    }
}
