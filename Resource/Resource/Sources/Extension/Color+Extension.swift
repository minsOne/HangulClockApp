//
//  Color+Extension.swift
//  Resource
//
//  Created by minsone on 2020/02/21.
//  Copyright © 2020 minsone. All rights reserved.
//

import Foundation
import SwiftUI
import UIKit

extension UIColor {
   convenience init(red: Int, green: Int, blue: Int, a: Int = 0xFF) {
       self.init(
           red: CGFloat(red) / 255.0,
           green: CGFloat(green) / 255.0,
           blue: CGFloat(blue) / 255.0,
           alpha: CGFloat(a) / 255.0
       )
   }

   // let's suppose alpha is the first component (ARGB)
   convenience init(argb: Int) {
       self.init(
           red: (argb >> 16) & 0xFF,
           green: (argb >> 8) & 0xFF,
           blue: argb & 0xFF,
           a: (argb >> 24) & 0xFF
       )
   }
}

extension Color {
    init(hex: Int, alpha: Double = 1) {
        let components = (
            R: Double((hex >> 16) & 0xff) / 255,
            G: Double((hex >> 08) & 0xff) / 255,
            B: Double((hex >> 00) & 0xff) / 255
        )
        self.init(
            .sRGB,
            red: components.R,
            green: components.G,
            blue: components.B,
            opacity: alpha
        )
    }
}

