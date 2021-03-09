//
//  LoggerInject.swift
//  App
//
//  Created by minsone on 2021/03/09.
//  Copyright © 2021 minsone. All rights reserved.
//

import Foundation
import Logger
import AnalyticsKit

class FirebaseAnalyticsKitWrapper: FirebaseAnalyticsInterface {
    func logEvent() {
        Logger.Firebase.logEvent()
    }
    
    func register() {
        Logger.Firebase.register()
    }
}
