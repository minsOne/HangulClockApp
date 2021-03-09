//
//  SettingsView.swift
//  Settings
//
//  Created by minsone on 2020/02/21.
//  Copyright © 2020 minsone. All rights reserved.
//

import Foundation
import SwiftUI
import Resource
import PureSwiftUI

struct SettingsView {
    @ObservedObject var state: SettingsViewState
}

extension SettingsView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("THEME").font(.headline)) {
                    ColorRow(colors: state.colors,
                             tapGesture: state.selectThemeColor)
                        .frame(height: 80)
                }
                AuthorSectionView()
                LicenseSectionView()
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle(Text("Settings").font(.largeTitle))
            .navigationBarItems(trailing:
                Button("닫기") {
                    self.state.onDisappear()
                }
            )
        }
        .onAppear(perform: state.onAppear)
        .onDisappear(perform: state.onDisappear)
    }
}

struct ColorRow: View {
    let colors: [R.Color]
    let tapGesture: ((R.Color) -> Void)?
    
    var body: some View {
        HStack(spacing: 10) {
            ForEach(colors, id: \.id) { item in
                Button("aaa") {
                    self.tapGesture?(item)
                }
                .buttonStyle(ColorButtonStyle(color: Color(item.color)))
            }
            Spacer()
        }
    }
}

struct ColorButtonStyle: ButtonStyle {
    var color: Color
    
    public func makeBody(configuration: Self.Configuration) -> some View {
        ColorButton(configuration: configuration, color: color)
    }
}


private struct ColorButton: View {
    let configuration: ButtonStyleConfiguration
    let color: Color
    
    var body: some View {
        
        return configuration.label
            .frame(40, 40)
            .cornerRadius(8)
            .foregroundColor(.white)
            .background(RoundedRectangle(cornerRadius: 5).fill(color))
            .compositingGroup()
            .opacity(configuration.isPressed ? 0.5 : 1.0)
    }
}
