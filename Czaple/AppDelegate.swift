//
//  AppDelegate.swift
//  Czaple
//
//  Created by Filip Trzaska on 05/04/2019.
//  Copyright © 2019 Filip Trzaska. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    private let firstLaunch = FirstLaunch()
    private let introProvider = IntroProvider()
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow()
        guard let window = window else { return true }
        let firstTime = firstLaunch.checkFirstLaunch()
        self.introProvider.showIntro(window: window, first: firstTime)
        return true
    }
}

