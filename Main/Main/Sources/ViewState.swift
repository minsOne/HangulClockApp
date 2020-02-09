//
//  ViewState.swift
//  Main
//
//  Created by minsone on 2020/02/08.
//  Copyright © 2020 minsone. All rights reserved.
//

import Foundation
import HangulClockTable

protocol ViewStateListner: class {
    func onAppear()
}

public class ViewState: ObservableObject {
    @Published var gridTexts: [[String]] = []
    @Published var gridMarks: [[Bool]] = []
    
    weak var listener: ViewStateListner?
    
    func onAppear() {
        listener?.onAppear()
    }
    
    func updateDate(date: Date) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        let today = dateFormatter.string(from: date)
        dateFormatter.dateFormat = "HH"
        let hour = dateFormatter.string(from: date)
        dateFormatter.dateFormat = "mm"
        let minute = dateFormatter.string(from: date)
        #if DEBUG
        print(#function, today, hour, minute)
        #endif
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
