//
//  UserDefaults+Auth.swift
//  SwiftCoreTraining
//
//  Created by Serhii Liamtsev on 12/18/21.
//  Copyright © 2021 Serg Liamtsev. All rights reserved.
//

import Foundation

extension UserDefaults {
    
    var userProfile: UserJSON? {
        
        get {
            return UserDefaults.shared.get(forKey: LocalStorageKeys.userProfile.rawValue, type: UserJSON.self)
        }
        set {
            UserDefaults.shared.set(object: newValue, forKey: LocalStorageKeys.userProfile.rawValue)
        }
    }
    
}
