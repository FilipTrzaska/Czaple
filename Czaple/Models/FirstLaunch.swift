//
//  FirstLaunch.swift
//  Czaple
//
//  Created by Filip Trzaska on 05/12/2019.
//  Copyright © 2019 Filip Trzaska. All rights reserved.
//

import UIKit

class FirstLaunch {
    static let instance = FirstLaunch()
    
    func checkFirstLaunch(window: UIWindow){
        if UserDefaults.standard.object(forKey: "firstTime") == nil {
            UserDefaults.standard.set(true, forKey: "firstTime")
        }
        UserDefaults.standard.synchronize()
        
        if UserDefaults.standard.bool(forKey: "firstTime") == true {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            let introViewController = IntroSwipingViewController(collectionViewLayout: layout)
            UserDefaults.standard.set(false, forKey: "firstTime")
            UserDefaults.standard.synchronize()
            
            window.rootViewController = introViewController
        } else {
            let mainViewController = MainView()
            let navigationController = UINavigationController(rootViewController: mainViewController)
            window.rootViewController = navigationController
        }
        
        window.makeKeyAndVisible()
    }
    
}
