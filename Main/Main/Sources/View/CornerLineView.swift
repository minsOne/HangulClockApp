//
//  CornerLineView.swift
//  Main
//
//  Created by minsone on 2020/02/10.
//  Copyright © 2020 minsone. All rights reserved.
//

import Foundation
import SwiftUI

struct CornerLineView {
    struct TopLeft: View {
        let size: CGSize
        
        var body: some View {
            VStack() {
                Spacer()
                Path { path in
                    let width = min(size.width, size.height)
                    let spacing: CGFloat = 7
                    let len = width / 5 / 2
                    path.addLines([
                        CGPoint(x: 0, y: 0),
                        CGPoint(x: 0, y: len),
                        CGPoint(x: spacing, y: len),
                        CGPoint(x: spacing, y: spacing),
                        CGPoint(x: len, y: spacing),
                        CGPoint(x: len, y: 0),
                        CGPoint(x: 0, y: 0)
                    ])
                }
                .fillColor(Color.white)
                .frame(size)
                Spacer()
            }
        }
    }
    
    struct BottomRight: View {
        let size: CGSize
        
        var body: some View {
            VStack() {
                Spacer()
                Path { path in
                    let width = min(size.width, size.height)
                    let spacing: CGFloat = 7
                    let len = width / 5 / 2
                    path.addLines([
                        CGPoint(x: width, y: width),
                        CGPoint(x: width, y: width-len),
                        CGPoint(x: width-spacing, y: width-len),
                        CGPoint(x: width-spacing, y: width-spacing),
                        CGPoint(x: width-len, y: width-spacing),
                        CGPoint(x: width-len, y: width),
                        CGPoint(x: width, y: width),
                    ])
                }
                .fillColor(Color.white)
                .frame(size)
                Spacer()
            }
        }
    }
}
