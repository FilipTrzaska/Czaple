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
    private let attractionProvider: AttractionProviderProtocol
    private let boardAlert: BoardAlerting
    
    init(attractionProvider: AttractionProviderProtocol, boardAlert: BoardAlerting) {
        self.attractionProvider = attractionProvider
        self.boardAlert = boardAlert
    }
    
    func showIntro(window: UIWindow, first: Bool) {
        if first == true {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            let introViewController = IntroSwipingViewController(attractionProvider: attractionProvider, boardAlert: boardAlert)
            UserDefaults.standard.set(false, forKey: "firstTime")
            
            window.rootViewController = introViewController
        } else {
            let mainViewController = MainView(attractionProvider: attractionProvider, boardAlert: boardAlert)
            let navigationController = UINavigationController(rootViewController: mainViewController)
            window.rootViewController = navigationController
        }
        
        window.makeKeyAndVisible()
    }
}
