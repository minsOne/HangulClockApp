//
//  Preview.swift
//  App
//
//  Created by minsone on 2020/02/08.
//  Copyright © 2020 minsone. All rights reserved.
//

import Foundation
import MainScene
import SwiftUI
import Resource

#if DEBUG
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        return Text("3333")
            .font(Font.custom("alarmclock", size: 100))
    }
}

struct TestFadeNumbers: View {
    @State private var textValue: Int = 2

    var body: some View {
        VStack (spacing: 50) {
            if textValue % 2 == 0 {
                Text("\(textValue)")
                    .font(.system(size: 200))
                    .transition(.opacity)
            }
            if textValue % 3 == 1 {
                Text("\(textValue)")
                    .font(.system(size: 200))
                    .transition(.opacity)
            }
            Button("Next") {
                withAnimation(.linear(duration: 0.25), {
                    self.textValue += 1
                })
            }
            Button("Reset") {
                withAnimation(.easeInOut(duration: 0.25), {
                    self.textValue = 0
                })
            }
        }
    }
}

#endif
