//
//  ClockTable.swift
//  ClockTable
//
//  Created by minsone on 2020/02/08.
//  Copyright © 2020 minsone. All rights reserved.
//

import Foundation

public struct Table {
    public let texts = [["한", "두", "세", "네", "다", "섯"],
                        ["여", "섯", "일", "곱", "여", "덟"],
                        ["아", "홉", "열", "한", "두", "시"],
                        ["자", "이", "삼", "사", "오", "십"],
                        ["정", "일", "이", "삼", "사", "육"],
                        ["오", "오", "칠", "팔", "구", "분"]]
    
    public let defaultTableMark = [[false,false,false,false,false,false],
                                   [false,false,false,false,false,false],
                                   [false,false,false,false,false,false],
                                   [false,false,false,false,false,false],
                                   [false,false,false,false,false,false],
                                   [false,false,false,false,false,false]]
    
    func isMidDay() -> Bool {
        return false
    }
    
    func isMidNight() -> Bool {
        return false
    }
    
    func hour(_ time: Int) -> [(row: Int, col: Int)] {
        switch time {
        case 1: return [(0,0), (1,5)]
        case 2: return []
        case 3: return []
        case 4: return []
        case 5: return []
        case 6: return []
        case 7: return []
        case 8: return []
        case 9: return []
        case 10: return []
        case 11: return []
        case 12: return []
        default: return []
        }
    }
}
