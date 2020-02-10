//
//  DateTextView.swift
//  Main
//
//  Created by minsone on 2020/02/10.
//  Copyright © 2020 minsone. All rights reserved.
//

import Foundation
import SwiftUI
import PureSwiftUI

struct DateTextView {
    struct Portrait: View {
        @Binding var date: String
        
        var body: some View {
            return HStack {
                TitleText("\(date)", .white, .bold)
                    .padding([.top, .leading], 20)
                Spacer()
            }
        }
    }
    
    struct Landscape: View {
        @Binding var year: String
        @Binding var month: String
        @Binding var day: String
        
        var body: some View {
            return HStack {
                TitleText("\(year)\n\(month)\n\(day)", .white, .bold)
                    .padding(EdgeInsets.init(20, 10, 0, 0))
                Spacer()
            }
        }
    }
}
