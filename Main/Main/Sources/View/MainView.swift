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
    private let size: CGSize
    @ObservedObject var state: ViewState
    
    public init(size: CGSize, state: ObservedObject<ViewState>) {
        self.size = size
        self._state = state
    }
}

extension MainView: View {
    public var body: some View {
        ZStack {
            dateText
            hangulClock
            
            CornerLineView.TopLeft(size: self.size)
            CornerLineView.BottomRight(size: self.size)
            settingButton
        }
        .onAppear(perform: state.onAppear)
        .onDisappear(perform: state.onDisappear)
        .onTapGesture(perform: state.tapView)
    }
}

private extension MainView {
    var dateText: some View {
        func geometryProxy(_ geometry: GeometryProxy) -> some View {
            let size = geometry.size
            return Group {
                if size.height > size.width {
                    DateTextView.Portrait(date: $state.date)
                } else {
                    DateTextView.Landscape(year: $state.year,
                                           month: $state.month,
                                           day: $state.day)
                }
            }
        }
        return VStack(alignment: .leading) {
            GeometryReader { geometry in
                geometryProxy(geometry)
                Spacer()
            }
        }
    }
}

private extension MainView {
    var hangulClock: some View {
        GridView(state.gridTexts.count, spacing: 8) { column, row in
            LargeTitleText("\(self.state.gridTexts[row][column])", .white, self.state.gridMarks[row][column] ? .bold : .regular)
                .opacity(self.state.gridMarks[row][column] ? 1 : 0.4)
                .animation(.easeInOut(duration: 0.5))
                .greedyFrame()
        }
        .frame(size.width-30, size.height-30)
    }
}

private extension MainView {
    var settingButton: some View {
        VStack(alignment: .trailing) {
            Spacer()
            HStack {
                Spacer()
            }
            Image(systemName: "gear")
                .foregroundColor(.white)
                .font(Font.system(.title).bold())
                .padding(.trailing, 20)
                .onTapGesture(perform: state.tapSettings)
                .opacity(state.isVisibleSettingsButton ? 1 : 0)
        }
    }
}
