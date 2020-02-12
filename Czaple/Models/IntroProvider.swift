//
//  IntroProvider.swift
//  Czaple
//
//  Created by Filip Trzaska on 12/02/2020.
//  Copyright © 2020 Filip Trzaska. All rights reserved.
//

import UIKit

protocol IntroProviding {
    func showIntro(window: UIWindow, first: Bool)
}

final class IntroProvider: IntroProviding {
    
    func showIntro(window: UIWindow, first: Bool) {
        if first == true {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            let introViewController = IntroSwipingViewController(collectionViewLayout: layout)
            UserDefaults.standard.set(false, forKey: "firstTime")
            
            window.rootViewController = introViewController
        } else {
            let mainViewController = MainView()
            let navigationController = UINavigationController(rootViewController: mainViewController)
            window.rootViewController = navigationController
        }
        
        window.makeKeyAndVisible()
    }
}
