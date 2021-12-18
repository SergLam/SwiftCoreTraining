//
//  UserDefaults+AppSettings.swift
//  SwiftCoreTraining
//
//  Created by Serhii Liamtsev on 12/18/21.
//  Copyright © 2021 Serg Liamtsev. All rights reserved.
//

import Foundation

extension UserDefaults {
    
    var appAlreadyRated: Bool? {
        get {
            return UserDefaults.shared.value(forKey: LocalStorageKeys.appAlreadyRated.rawValue) as? Bool
        }
        set {
            UserDefaults.shared.set(newValue, forKey: LocalStorageKeys.appAlreadyRated.rawValue)
        }
    }
    
    /**
    Flag to determine whether migration for user defaults is required during app update
    */
    var currentAppVersion: String? {
        get {
            return UserDefaults.shared.value(forKey: LocalStorageKeys.currentVersionNumber.rawValue) as? String
        }
        set {
            UserDefaults.shared.set(newValue, forKey: LocalStorageKeys.currentVersionNumber.rawValue)
        }
    }
    
    /**
    Flag to determine selected locale for app in user profile settings
     
    Because of using R.swift - need to save language code
     
     https://developer.apple.com/documentation/foundation/nslocale/1643026-languagecode
    */
    var selectedLocaleCode: String {
        get {
            // Locale.current.languageCode
            // NOTE: - Customer requirement - production app should be ONLY in Russian
            #if DEBUG
            return UserDefaults.shared.value(forKey: LocalStorageKeys.selectedLocaleCode.rawValue) as? String ?? "en"
            #else
            return UserDefaults.shared.value(forKey: LocalStorageKeys.selectedLocaleCode.rawValue) as? String ?? "ru"
            #endif
            
        }
        set {
            UserDefaults.shared.set(newValue, forKey: LocalStorageKeys.selectedLocaleCode.rawValue)
        }
    }
    
}
