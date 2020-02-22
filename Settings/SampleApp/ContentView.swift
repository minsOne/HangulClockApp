//
//  ContentView.swift
//  SampleApp
//
//  Created by minsone on 2020/02/22.
//  Copyright © 2020 minsone. All rights reserved.
//

import SwiftUI
import Resource
struct ContentView: View {
    var body: some View {
        SettingsView(state: ViewState(colors: R.ThemeColor.list))
//        ContentView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
