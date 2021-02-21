//
//  Color.swift
//  Resource
//
//  Created by minsone on 2020/02/21.
//  Copyright © 2020 minsone. All rights reserved.
//

import Foundation
import SwiftUI

extension R {
    public struct Color: Identifiable {
        public var id = UUID()
        public var key: String
        public var color: UIColor
    }
}

public extension R.Color {
    static var c0: R.Color { .init(key: "c0", color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)) }
    static var c1: R.Color { .init(key: "c1", color: #colorLiteral(red: 0.8509803922, green: 0.6588235294, blue: 0.4941176471, alpha: 1)) }
    static var c2: R.Color { .init(key: "c2", color: #colorLiteral(red: 0.5137254902, green: 0.6392156863, blue: 0.7882352941, alpha: 1)) }
    static var c3: R.Color { .init(key: "c3", color: #colorLiteral(red: 0.9333333333, green: 0.6235294118, blue: 0.6549019608, alpha: 1)) }
    static var c4: R.Color { .init(key: "c4", color: #colorLiteral(red: 0.5333333333, green: 0.6980392157, blue: 0.2901960784, alpha: 1)) }
}
