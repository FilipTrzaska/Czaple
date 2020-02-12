//
//  FirstLaunch.swift
//  Czaple
//
//  Created by Filip Trzaska on 05/12/2019.
//  Copyright © 2019 Filip Trzaska. All rights reserved.
//

import UIKit

protocol FirstLaunchProtocol {
    func checkFirstLaunch() -> Bool
}

class FirstLaunch: FirstLaunchProtocol {
    private let userDefaults = UserDefaults.standard
    
    func checkFirstLaunch() -> Bool {
        if userDefaults.object(forKey: "firstTime") == nil {
            userDefaults.set(true, forKey: "firstTime")
            return true
        }
        
        return false
    }
}
