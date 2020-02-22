//
//  AppDelegate.swift
//  App
//
//  Created by minsone on 2020/02/06.
//  Copyright © 2020 minsone. All rights reserved.
//

import UIKit
import RIBs
import Main
import Resource
import Logger
import MetricKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    private var launchRouter: LaunchRouting?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        startConfigure(with: application)
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        
        let launchRouter = MainBuilder(dependency: AppComponent()).build()
        self.launchRouter = launchRouter
        launchRouter.launch(from: window)
        
        return true
    }
    
    private func startConfigure(with application: UIApplication) {
        Logger.Firebase.register()
        application.isIdleTimerDisabled = true
        
        if #available(iOS 13.0, *) {
            MXMetricManager.shared.add(self)
        }
        
    }
    
    private func finishConfigure(with application: UIApplication) {
        if #available(iOS 13.0, *) {
            MXMetricManager.shared.remove(self)
        }
    }

}

extension AppDelegate: MXMetricManagerSubscriber {
    @available(iOS 13.0, *)
    func didReceive(_ payloads: [MXMetricPayload]) {
        
    }
}

