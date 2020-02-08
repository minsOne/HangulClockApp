//
//  HangulTable.swift
//  HangulClockTable
//
//  Created by minsone on 2020/02/08.
//  Copyright © 2020 minsone. All rights reserved.
//

import Foundation

public struct HangulTable {}
public extension HangulTable {
    static let texts = [["한", "두", "세", "네", "다", "섯"],
                        ["여", "섯", "일", "곱", "여", "덟"],
                        ["아", "홉", "열", "한", "두", "시"],
                        ["자", "이", "삼", "사", "오", "십"],
                        ["정", "일", "이", "삼", "사", "오"],
                        ["오", "육", "칠", "팔", "구", "분"]]
    
    static let marks = [[false,false,false,false,false,false],
                        [false,false,false,false,false,false],
                        [false,false,false,false,false,false],
                        [false,false,false,false,false,false],
                        [false,false,false,false,false,false],
                        [false,false,false,false,false,false]]
}

public extension HangulTable {
    struct Mark {}
}

public extension HangulTable.Mark {
    static var midDay: [(row: Int, col: Int)] {
        return [(4,0),(5,0)]
    }
    static var midNight: [(row: Int, col: Int)] {
        return [(3,0),(4,0)]
    }
    static func hour(_ hour: Int) -> [(row: Int, col: Int)] {
        let mark_시 = [(2,5)]
        let mark_시간: [(Int, Int)]
        switch hour {
        case 1: mark_시간 = [(0,0)]
        case 2: mark_시간 = [(0,1)]
        case 3: mark_시간 = [(0,2)]
        case 4: mark_시간 = [(0,3)]
        case 5: mark_시간 = [(0,4),(0,5)]
        case 6: mark_시간 = [(1,0),(1,1)]
        case 7: mark_시간 = [(1,2),(1,3)]
        case 8: mark_시간 = [(1,4),(1,5)]
        case 9: mark_시간 = [(2,0),(2,1)]
        case 10: mark_시간 = [(2,2)]
        case 11: mark_시간 = [(2,2),(2,3)]
        case 12: mark_시간 = [(2,2),(2,4)]
        default: return []
        }
        return mark_시간 + mark_시
    }
    
    static func minute(_ minute: Int) -> [(row: Int, col: Int)] {
        guard minute != 0, minute != 60 else { return [] }
        
        let mark_분 = [(5,5)]
        let mark_일분: [(Int, Int)]
        let mark_십분: [(Int, Int)]
        
        switch minute % 10 {
        case 1: mark_일분 = [(4,1)]
        case 2: mark_일분 = [(4,2)]
        case 3: mark_일분 = [(4,3)]
        case 4: mark_일분 = [(4,4)]
        case 5: mark_일분 = [(4,5)]
        case 6: mark_일분 = [(5,1)]
        case 7: mark_일분 = [(5,2)]
        case 8: mark_일분 = [(5,3)]
        case 9: mark_일분 = [(5,4)]
        case 0: mark_일분 = []
        default: mark_일분 = []
        }
        
        switch minute / 10 {
        case 1: mark_십분 = [(3,5)]
        case 2: mark_십분 = [(3,1),(3,5)]
        case 3: mark_십분 = [(3,2),(3,5)]
        case 4: mark_십분 = [(3,3),(3,5)]
        case 5: mark_십분 = [(3,4),(3,5)]
        default: mark_십분 = []
        }
        
        return mark_십분 + mark_일분 + mark_분
    }
}
