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
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let attractionProvider = AttractionProvider()
        let boardProvider = BoardProvider()
        let boardAudioPlayer = BoardAudioPlayer()
        let boardAlert = BoardAlert(boardProvider: boardProvider, boardAudioPlayer: boardAudioPlayer)
        
        let introProvider = IntroProvider(attractionProvider: attractionProvider, boardAlert: boardAlert)
        window = UIWindow()
        guard let window = window else { return true }
        let firstTime = firstLaunch.checkFirstLaunch()
        introProvider.showIntro(window: window, first: firstTime)
        return true
    }
}

