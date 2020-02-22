//
//  R+ThemeColor.swift
//  Resource
//
//  Created by minsone on 2020/02/21.
//  Copyright © 2020 minsone. All rights reserved.
//

import Foundation
import UIKit

extension R {
    public struct ThemeColor {
        // 저장된 색상이 없는 경우, 기본 색상
        static var defaultColor: R.Color {
            .c0
        }
        // 현재 테마 색상
        public static var list: [R.Color] {
            [.c0, .c3, .c1, .c2]
        }
        /// 저장된 색상
        public static var savedColor: R.Color {
            let key = ColorStorage.defaultColorKey
            return list.first { $0.key == key } ?? defaultColor
        }
        
        public static func saveColor(_ color: R.Color) {
            ColorStorage.defaultColorKey = color.key
        }
    }
}
