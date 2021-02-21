//
//  Array+SafeSubscript.swift
//  FoundationExtension
//
//  Created by minsone on 2020/02/09.
//  Copyright © 2020 minsone. All rights reserved.
//

/*
Array extension - safely get array value
Platform : iOS / OSX
Language : Swift
Required: iOS 9.0 and later
*/

public extension Array {
    subscript (safe index: Int) -> Element? {
        return indices ~= index ? self[index] : nil
    }
}
