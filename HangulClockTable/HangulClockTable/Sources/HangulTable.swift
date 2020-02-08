//
//  HangulTable.swift
//  HangulClockTable
//
//  Created by minsone on 2020/02/08.
//  Copyright © 2020 minsone. All rights reserved.
//

import Foundation


public struct HangulTable {
    typealias TextTable = [[String]]
    public let texts = [["한", "두", "세", "네", "다", "섯"],
                        ["여", "섯", "일", "곱", "여", "덟"],
                        ["아", "홉", "열", "한", "두", "시"],
                        ["자", "이", "삼", "사", "오", "십"],
                        ["정", "일", "이", "삼", "사", "육"],
                        ["오", "오", "칠", "팔", "구", "분"]]
    
    public let marks = [[false,false,false,false,false,false],
                        [false,false,false,false,false,false],
                        [false,false,false,false,false,false],
                        [false,false,false,false,false,false],
                        [false,false,false,false,false,false],
                        [false,false,false,false,false,false]]
}
