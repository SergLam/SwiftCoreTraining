//
//  UserDefaults+Ext.swift
//  SwiftCoreTraining
//
//  Created by Serhii Liamtsev on 12/18/21.
//  Copyright © 2021 Serg Liamtsev. All rights reserved.
//

import Foundation

extension UserDefaults {
    
    static let shared = UserDefaults(suiteName: Environment.bundleId) ?? UserDefaults.standard
    
    static func removeAllData() {
        UserDefaults.shared.userProfile = nil
        
        UserDefaults.shared.appAlreadyRated = nil
        
        UserDefaults.shared.deviceToken = nil
        UserDefaults.shared.deviceId = nil
    }
}
