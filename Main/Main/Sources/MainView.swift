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
    @ObservedObject var model: ViewState
    
    public init(size: CGSize, model: ObservedObject<ViewState>) {
        self.size = size
        self._model = model
    }
}

extension MainView: View {
    public var body: some View {
        GridView(model.gridTexts.count, spacing: 8) { column, row in
            LargeTitleText("\(self.model.gridTexts[row][column])", .white, .bold)
                .opacity(self.model.gridMarks[row][column] ? 1 : 0.4)
                .animation(.easeInOut(duration: 0.5))
                .greedyFrame()
//                .shadowIf(self.model.gridMarks[row][column], color: .white, radius: 10)
//                .shadowColor(.white, 5)
        }
        .frame(size.width, size.height)
        .onAppear(perform: model.onAppear)
    }
}
