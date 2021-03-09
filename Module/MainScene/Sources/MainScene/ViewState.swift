//
//  ViewState.swift
//  Main
//
//  Created by minsone on 2020/02/08.
//  Copyright © 2020 minsone. All rights reserved.
//

import Foundation
import HangulClockTable
import UIKit
import RxSwift
import RxCocoa

protocol ViewStateListner: class {
    func onAppear()
    func tapSettings()
}

public class ViewState: ObservableObject {
    @Published var gridTexts: [[String]] = []
    @Published var gridMarks: [[Bool]] = []
    @Published var date: String = ""
    @Published var year: String = ""
    @Published var month: String = ""
    @Published var day: String = ""
    @Published var isVisibleSettingsButton = false {
        willSet {
            objectWillChange.send()
        }
    }
    
    weak var listener: ViewStateListner?
    
    private var visualSettingButtonTimerDisposeBag = DisposeBag()
    
    func updateDate(date: Date) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        let year = dateFormatter.string(from: date)
        dateFormatter.dateFormat = "MM"
        let month = dateFormatter.string(from: date)
        dateFormatter.dateFormat = "dd"
        let day = dateFormatter.string(from: date)
        dateFormatter.dateFormat = "HH:mm:ss"
        let time = dateFormatter.string(from: date)
        dateFormatter.dateFormat = "HH"
        let hour = dateFormatter.string(from: date)
        dateFormatter.dateFormat = "mm"
        let minute = dateFormatter.string(from: date)
        #if DEBUG
//        print(#function, year, month, day, time, hour, minute)
        #endif
        
        self.date = "\(year)년 \(Int(month) ?? 0)월 \(Int(day) ?? 0)일"
        self.year = "\(year)년"
        self.month = "\(Int(month) ?? 0)월"
        self.day = "\(Int(day) ?? 0)일"
        
        var mark = HangulTable.marks
        let markList = HangulTable.Mark.midDay(str: hour)
            + HangulTable.Mark.midNight(str: hour)
            + HangulTable.Mark.hour(str: hour)
            + HangulTable.Mark.minute(str: minute)
        
        markList.forEach {
            mark[$0.row][$0.col] = true
        }
        gridMarks = mark
    }
    
    func onAppear() {
        listener?.onAppear()
    }
    
    func onDisappear() {
        print(#file, #function)
    }
    
    func tapSettings() {
        listener?.tapSettings()
    }
    
    func tapView() {
        print(#file, #function)
        if isVisibleSettingsButton == false {
           isVisibleSettingsButton = true
            Single<Int>.just(1)
                .delay(.seconds(4), scheduler: MainScheduler.instance)
                .subscribe { [weak self] _ in
                    self?.isVisibleSettingsButton = false
            }.disposed(by: visualSettingButtonTimerDisposeBag)
        } else {
           isVisibleSettingsButton = false
            visualSettingButtonTimerDisposeBag = DisposeBag()
        }
    }
}

private extension HangulTable.Mark {
    static func midDay(str: String) -> [(row: Int, col: Int)] {
        let time = Int(str) ?? 0
        return midDay(hour: time)
    }
    static func midNight(str: String) -> [(row: Int, col: Int)] {
        let time = Int(str) ?? 0
        return midNight(hour: time)
    }
    static func hour(str: String) -> [(row: Int, col: Int)] {
        let time = Int(str) ?? 0
        return hour(time)
    }
    static func minute(str: String) -> [(row: Int, col: Int)] {
        let time = Int(str) ?? 0
        return minute(time)
    }
}
