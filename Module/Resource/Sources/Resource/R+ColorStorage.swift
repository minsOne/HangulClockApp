//
//  R+ColorStorage.swift
//  Resource
//
//  Created by minsone on 2020/02/21.
//  Copyright © 2020 minsone. All rights reserved.
//

import Foundation

@propertyWrapper
struct Storage {
    private let key: String
    private let defaultValue: String
    
    init(key: String, defaultValue: String) {
        self.key = key
        self.defaultValue = defaultValue
    }
    
    var wrappedValue: String {
        get {
            UserDefaults.standard.string(forKey: key) ?? defaultValue
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
}

struct ColorStorage {
    @Storage(key: "defaultColorKey", defaultValue: "")
    static var defaultColorKey: String
}
