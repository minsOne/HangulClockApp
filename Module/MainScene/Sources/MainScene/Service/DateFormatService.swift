//
//  DateFormatService.swift
//  Main
//
//  Created by minsone on 2020/02/08.
//  Copyright © 2020 minsone. All rights reserved.
//

import Foundation

public protocol DateFormatServicable {
    func date(_ date: Date) -> String
}

struct DateFormatService: DateFormatServicable {
    func date(_ date: Date) -> String {
        return date.description
    }
}
