//
//  MainView.swift
//  Main
//
//  Created by minsone on 2020/02/08.
//  Copyright © 2020 minsone. All rights reserved.
//

import SwiftUI
import PureSwiftUI
import PureSwiftUITools

public struct MainView {
    private let gridTexts = [["한", "두", "세", "네", "다", "섯"],
                             ["여", "섯", "일", "곱", "여", "덟"],
                             ["아", "홉", "열", "한", "두", "시"],
                             ["자", "이", "삼", "사", "오", "십"],
                             ["정", "일", "이", "삼", "사", "육"],
                             ["오", "오", "칠", "팔", "구", "분"]]
    @State var turnOnOffGrid: [[Bool]] = [[false, false, false, false, false, false],
                                          [false, false, false, false, false, false],
                                          [false, false, false, false, false, false],
                                          [false, false, false, false, false, false],
                                          [false, false, false, false, false, false],
                                          [false, false, false, false, false, false]]

    private let size: CGSize
    @ObservedObject var model: ViewState
    
    public init(size: CGSize, model: ObservedObject<ViewState>) {
        self.size = size
        self._model = model
    }
}

extension MainView: View {
    public var body: some View {
        return Text("3333")
            .font(Font.custom("alarmclock", size: 100))
//        Text(model.date)
//            .onAppear(perform: model.onAppear)
//        GridView(6, spacing: 8) { column, row in
//            ZStack {
//                TitleText("\(self.gridTexts[row][column])", self.turnOnOffGrid[row][column] ? .red : .black)
//                    .greedyFrame()
//                    .shadow(5)
//                Button(action: {
//                    self.turnOnOffGrid[row][column].toggle()
//                }) {
//                    TitleText("\(self.gridTexts[row][column])", .clear)
//                }
//            }
//        }
    }
}
