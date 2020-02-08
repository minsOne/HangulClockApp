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
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    private var launchRouter: LaunchRouting?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        configure()
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        
        let launchRouter = MainBuilder(dependency: AppComponent()).build()
        self.launchRouter = launchRouter
        launchRouter.launch(from: window)
        
        return true
    }
    
    private func configure() {
        Logger.Firebase.register()
    }
}

