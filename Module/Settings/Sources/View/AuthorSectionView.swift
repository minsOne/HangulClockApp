//
//  AuthorSectionView.swift
//  Settings
//
//  Created by minsone on 2020/02/22.
//  Copyright © 2020 minsone. All rights reserved.
//

import Foundation
import SwiftUI

struct AuthorSectionView: View {
    var body: some View {
        Section(header: Text("Author").font(.headline)) {
            Text("Developer : Ahn Jung Min")
            Text("Designer : Lee Do Yeong")
        }
    }
}

struct LicenseSectionView: View {
    var body: some View {
        Section(header: Text("License").font(.headline)) {
            Text("""
                원 저작자인 이호민님께 한글시계 제작을 허락을 받고, 현 디자인으로 만든 이상훈님께 iOS 앱으로 만드는 것을 허락받았습니다.

                이호민님의 한글시계 CC BY-SA 라이선스를 따르고 있습니다.

                한글시계 for iOS는 Github 저장소에서 확인할 수 있습니다.
                """)
                .padding()
            Text("Github으로 이동")
                .foregroundColor(Color.blue)
                .padding()
                .onTapGesture {
                    URL(string: "https://github.com/minsOne/HangulClockApp")
                        .map { UIApplication.shared.open($0) }
            }
        }
    }
}
