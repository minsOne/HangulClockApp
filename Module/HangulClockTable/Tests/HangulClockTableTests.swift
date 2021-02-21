//
//  HangulClockTableTests.swift
//  HangulClockTableTests
//
//  Created by minsone on 2020/02/08.
//  Copyright © 2020 minsone. All rights reserved.
//

import XCTest
@testable import HangulClockTable

class HangulClockTableTests: XCTestCase {
    func test_mark_hour_table() {
        let texts = HangulTable.texts
        XCTAssertEqual(HangulTable.Mark.hour(0).map { texts[$0.row][$0.col] }.joined(),
        "")
        XCTAssertEqual(HangulTable.Mark.hour(1).map { texts[$0.row][$0.col] }.joined(),
                       "한시")
        XCTAssertEqual(HangulTable.Mark.hour(2).map { texts[$0.row][$0.col] }.joined(),
                       "두시")
        XCTAssertEqual(HangulTable.Mark.hour(3).map { texts[$0.row][$0.col] }.joined(),
                       "세시")
        XCTAssertEqual(HangulTable.Mark.hour(4).map { texts[$0.row][$0.col] }.joined(),
                       "네시")
        XCTAssertEqual(HangulTable.Mark.hour(5).map { texts[$0.row][$0.col] }.joined(),
                       "다섯시")
        XCTAssertEqual(HangulTable.Mark.hour(6).map { texts[$0.row][$0.col] }.joined(),
                       "여섯시")
        XCTAssertEqual(HangulTable.Mark.hour(7).map { texts[$0.row][$0.col] }.joined(),
                       "일곱시")
        XCTAssertEqual(HangulTable.Mark.hour(8).map { texts[$0.row][$0.col] }.joined(),
                       "여덟시")
        XCTAssertEqual(HangulTable.Mark.hour(9).map { texts[$0.row][$0.col] }.joined(),
                       "아홉시")
        XCTAssertEqual(HangulTable.Mark.hour(10).map { texts[$0.row][$0.col] }.joined(),
                       "열시")
        XCTAssertEqual(HangulTable.Mark.hour(11).map { texts[$0.row][$0.col] }.joined(),
                       "열한시")
        XCTAssertEqual(HangulTable.Mark.hour(12).map { texts[$0.row][$0.col] }.joined(),
                       "열두시")
        
    }
    
    func test_mark_minute_table() {
        let texts = HangulTable.texts
        XCTAssertEqual(HangulTable.Mark.minute(0).map { texts[$0.row][$0.col] }.joined(),
                       "")
        XCTAssertEqual(HangulTable.Mark.minute(1).map { texts[$0.row][$0.col] }.joined(),
                       "일분")
        XCTAssertEqual(HangulTable.Mark.minute(2).map { texts[$0.row][$0.col] }.joined(),
                       "이분")
        XCTAssertEqual(HangulTable.Mark.minute(3).map { texts[$0.row][$0.col] }.joined(),
                       "삼분")
        XCTAssertEqual(HangulTable.Mark.minute(4).map { texts[$0.row][$0.col] }.joined(),
                       "사분")
        XCTAssertEqual(HangulTable.Mark.minute(5).map { texts[$0.row][$0.col] }.joined(),
                       "오분")
        XCTAssertEqual(HangulTable.Mark.minute(6).map { texts[$0.row][$0.col] }.joined(),
                       "육분")
        XCTAssertEqual(HangulTable.Mark.minute(7).map { texts[$0.row][$0.col] }.joined(),
                       "칠분")
        XCTAssertEqual(HangulTable.Mark.minute(8).map { texts[$0.row][$0.col] }.joined(),
                       "팔분")
        XCTAssertEqual(HangulTable.Mark.minute(9).map { texts[$0.row][$0.col] }.joined(),
                       "구분")
        XCTAssertEqual(HangulTable.Mark.minute(10).map { texts[$0.row][$0.col] }.joined(),
                       "십분")
        
        XCTAssertEqual(HangulTable.Mark.minute(11).map { texts[$0.row][$0.col] }.joined(),
                       "십일분")
        XCTAssertEqual(HangulTable.Mark.minute(12).map { texts[$0.row][$0.col] }.joined(),
                       "십이분")
        XCTAssertEqual(HangulTable.Mark.minute(13).map { texts[$0.row][$0.col] }.joined(),
                       "십삼분")
        XCTAssertEqual(HangulTable.Mark.minute(14).map { texts[$0.row][$0.col] }.joined(),
                       "십사분")
        XCTAssertEqual(HangulTable.Mark.minute(15).map { texts[$0.row][$0.col] }.joined(),
                       "십오분")
        XCTAssertEqual(HangulTable.Mark.minute(16).map { texts[$0.row][$0.col] }.joined(),
                       "십육분")
        XCTAssertEqual(HangulTable.Mark.minute(17).map { texts[$0.row][$0.col] }.joined(),
                       "십칠분")
        XCTAssertEqual(HangulTable.Mark.minute(18).map { texts[$0.row][$0.col] }.joined(),
                       "십팔분")
        XCTAssertEqual(HangulTable.Mark.minute(19).map { texts[$0.row][$0.col] }.joined(),
                       "십구분")
        XCTAssertEqual(HangulTable.Mark.minute(20).map { texts[$0.row][$0.col] }.joined(),
                       "이십분")
        
        XCTAssertEqual(HangulTable.Mark.minute(21).map { texts[$0.row][$0.col] }.joined(),
                       "이십일분")
        XCTAssertEqual(HangulTable.Mark.minute(22).map { texts[$0.row][$0.col] }.joined(),
                       "이십이분")
        XCTAssertEqual(HangulTable.Mark.minute(23).map { texts[$0.row][$0.col] }.joined(),
                       "이십삼분")
        XCTAssertEqual(HangulTable.Mark.minute(24).map { texts[$0.row][$0.col] }.joined(),
                       "이십사분")
        XCTAssertEqual(HangulTable.Mark.minute(25).map { texts[$0.row][$0.col] }.joined(),
                       "이십오분")
        XCTAssertEqual(HangulTable.Mark.minute(26).map { texts[$0.row][$0.col] }.joined(),
                       "이십육분")
        XCTAssertEqual(HangulTable.Mark.minute(27).map { texts[$0.row][$0.col] }.joined(),
                       "이십칠분")
        XCTAssertEqual(HangulTable.Mark.minute(28).map { texts[$0.row][$0.col] }.joined(),
                       "이십팔분")
        XCTAssertEqual(HangulTable.Mark.minute(29).map { texts[$0.row][$0.col] }.joined(),
                       "이십구분")
        XCTAssertEqual(HangulTable.Mark.minute(30).map { texts[$0.row][$0.col] }.joined(),
                       "삼십분")
        
        
        XCTAssertEqual(HangulTable.Mark.minute(31).map { texts[$0.row][$0.col] }.joined(),
                       "삼십일분")
        XCTAssertEqual(HangulTable.Mark.minute(32).map { texts[$0.row][$0.col] }.joined(),
                       "삼십이분")
        XCTAssertEqual(HangulTable.Mark.minute(33).map { texts[$0.row][$0.col] }.joined(),
                       "삼십삼분")
        XCTAssertEqual(HangulTable.Mark.minute(34).map { texts[$0.row][$0.col] }.joined(),
                       "삼십사분")
        XCTAssertEqual(HangulTable.Mark.minute(35).map { texts[$0.row][$0.col] }.joined(),
                       "삼십오분")
        XCTAssertEqual(HangulTable.Mark.minute(36).map { texts[$0.row][$0.col] }.joined(),
                       "삼십육분")
        XCTAssertEqual(HangulTable.Mark.minute(37).map { texts[$0.row][$0.col] }.joined(),
                       "삼십칠분")
        XCTAssertEqual(HangulTable.Mark.minute(38).map { texts[$0.row][$0.col] }.joined(),
                       "삼십팔분")
        XCTAssertEqual(HangulTable.Mark.minute(39).map { texts[$0.row][$0.col] }.joined(),
                       "삼십구분")
        XCTAssertEqual(HangulTable.Mark.minute(40).map { texts[$0.row][$0.col] }.joined(),
                       "사십분")
        
        XCTAssertEqual(HangulTable.Mark.minute(41).map { texts[$0.row][$0.col] }.joined(),
                       "사십일분")
        XCTAssertEqual(HangulTable.Mark.minute(42).map { texts[$0.row][$0.col] }.joined(),
                       "사십이분")
        XCTAssertEqual(HangulTable.Mark.minute(43).map { texts[$0.row][$0.col] }.joined(),
                       "사십삼분")
        XCTAssertEqual(HangulTable.Mark.minute(44).map { texts[$0.row][$0.col] }.joined(),
                       "사십사분")
        XCTAssertEqual(HangulTable.Mark.minute(45).map { texts[$0.row][$0.col] }.joined(),
                       "사십오분")
        XCTAssertEqual(HangulTable.Mark.minute(46).map { texts[$0.row][$0.col] }.joined(),
                       "사십육분")
        XCTAssertEqual(HangulTable.Mark.minute(47).map { texts[$0.row][$0.col] }.joined(),
                       "사십칠분")
        XCTAssertEqual(HangulTable.Mark.minute(48).map { texts[$0.row][$0.col] }.joined(),
                       "사십팔분")
        XCTAssertEqual(HangulTable.Mark.minute(49).map { texts[$0.row][$0.col] }.joined(),
                       "사십구분")
        XCTAssertEqual(HangulTable.Mark.minute(50).map { texts[$0.row][$0.col] }.joined(),
                       "오십분")
        
        XCTAssertEqual(HangulTable.Mark.minute(51).map { texts[$0.row][$0.col] }.joined(),
                       "오십일분")
        XCTAssertEqual(HangulTable.Mark.minute(52).map { texts[$0.row][$0.col] }.joined(),
                       "오십이분")
        XCTAssertEqual(HangulTable.Mark.minute(53).map { texts[$0.row][$0.col] }.joined(),
                       "오십삼분")
        XCTAssertEqual(HangulTable.Mark.minute(54).map { texts[$0.row][$0.col] }.joined(),
                       "오십사분")
        XCTAssertEqual(HangulTable.Mark.minute(55).map { texts[$0.row][$0.col] }.joined(),
                       "오십오분")
        XCTAssertEqual(HangulTable.Mark.minute(56).map { texts[$0.row][$0.col] }.joined(),
                       "오십육분")
        XCTAssertEqual(HangulTable.Mark.minute(57).map { texts[$0.row][$0.col] }.joined(),
                       "오십칠분")
        XCTAssertEqual(HangulTable.Mark.minute(58).map { texts[$0.row][$0.col] }.joined(),
                       "오십팔분")
        XCTAssertEqual(HangulTable.Mark.minute(59).map { texts[$0.row][$0.col] }.joined(),
                       "오십구분")
        XCTAssertEqual(HangulTable.Mark.minute(60).map { texts[$0.row][$0.col] }.joined(),
                       "")
    }
    
    func test_mark_mid_table() {
        let texts = HangulTable.texts
        XCTAssertEqual(HangulTable.Mark.midDay(hour: 12).map { texts[$0.row][$0.col] }.joined(),
                       "정오")
        XCTAssertEqual(HangulTable.Mark.midNight(hour: 0).map { texts[$0.row][$0.col] }.joined(),
                       "자정")
    }
}
