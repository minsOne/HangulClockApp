//
//  ViewState.swift
//  Settings
//
//  Created by minsone on 2020/02/21.
//  Copyright © 2020 minsone. All rights reserved.
//

import Foundation
import SwiftUI
import Resource

protocol ViewStateListener: class {
    func onDisappear()
    func select(themeColor: R.Color)
}

class SettingsViewState: ObservableObject {
    var colors: [R.Color]
    weak var listener: ViewStateListener?
    
    init(colors: [R.Color]) {
        self.colors = colors
    }
    
    func onAppear() {}
    
    func onDisappear() {
        print(#file, #function)
        listener?.onDisappear()
    }
    
    func selectThemeColor(_ color: R.Color) {
        listener?.select(themeColor: color)
    }
}
