//
//  SupportedLocales.swift
//  SwiftCoreTraining
//
//  Created by Serhii Liamtsev on 12/18/21.
//  Copyright © 2021 Serg Liamtsev. All rights reserved.
//

import UIKit

enum SupportedLocales: Int, CaseIterable {
    
    case english = 0
    case russian = 1
    
    var identifier: String {
        switch self {
        case .english:
            return "en-US"
        case .russian:
            return "ru-RU"
        }
    }
    
    var locale: Locale {
        return Locale(identifier: identifier)
    }
    
    var displayName: String {
        return NSLocale(localeIdentifier: Locale.current.identifier).displayName(forKey: NSLocale.Key.identifier, value: identifier) ?? ""
    }
    
    var flagCode: String {
        switch self {
        case .english:
            return "US"
        case .russian:
            return "RU"
        }
    }
    
    var flagImage: UIImage? {
        return UIImage(named: flagCode)
    }
    
    /**
     Use to save in UserDefaults.shared.selectedLocaleCode
     */
    var localeCode: String {
        switch self {
        case .english:
            return "en"
        case .russian:
            return "ru"
        }
    }
    
    static func getDefaultLocale() -> SupportedLocales {
        
        let defaultCode: String = Locale.current.languageCode?.lowercased() ?? SupportedLocales.russian.localeCode
        
        for locale in SupportedLocales.allCases {
            
            let locId: String = locale.localeCode
            if defaultCode.contains(locId) || defaultCode == locId {
                return locale
            }
        }
        return SupportedLocales.russian
    }
    
    static func getDefaultLocaleCode() -> String {
        
        let defaultCode: String = Locale.current.languageCode?.lowercased() ?? SupportedLocales.russian.localeCode
        
        for locale in SupportedLocales.allCases {
            
            let locId: String = locale.localeCode
            if defaultCode.contains(locId) || defaultCode == locId {
                return locId
            }
        }
        return defaultCode
    }
}
