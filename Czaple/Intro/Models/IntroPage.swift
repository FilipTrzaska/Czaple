//
//  IntroPage.swift
//  Czaple
//
//  Created by Filip Trzaska on 05/04/2019.
//  Copyright © 2019 Filip Trzaska. All rights reserved.
//

import Foundation

struct IntroPage {
    
    let imageName: String
    let introText: String
    let introBody: String
    
    init(imageName: String, introText: String, introBody: String) {
        self.imageName = imageName
        self.introText = introText
        self.introBody = introBody
    }
    
}
