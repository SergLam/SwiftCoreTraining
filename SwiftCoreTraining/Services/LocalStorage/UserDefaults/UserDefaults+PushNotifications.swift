//
//  UserDefaults+PushNotifications.swift
//  SwiftCoreTraining
//
//  Created by Serhii Liamtsev on 12/18/21.
//  Copyright © 2021 Serg Liamtsev. All rights reserved.
//

import Foundation

extension UserDefaults {

    /**
    UserJSON notifications settings flag.
    May be changed at Settings screen, use for /update_push_token logic
    */
    var isNotificationsEnabled: Bool? {
        get {
            return UserDefaults.shared.value(forKey: LocalStorageKeys.isNotificationsEnabled.rawValue) as? Bool
        }
        set {
            UserDefaults.shared.set(newValue, forKey: LocalStorageKeys.isNotificationsEnabled.rawValue)
        }
    }
    
    /**
    Use for remote push notifications.
    Also use for REST API request /api/v1/devices/{id}
    */
    var deviceToken: String? {
        get {
            return UserDefaults.shared.value(forKey: LocalStorageKeys.deviceToken.rawValue) as? String
        }
        set {
            UserDefaults.shared.set(newValue, forKey: LocalStorageKeys.deviceToken.rawValue)
        }
    }
    
    /**
       Use for remote push notifications.
       Also use for REST API request /api/v1/devices/{id}
    */
    var deviceId: Int? {
        get {
            return UserDefaults.shared.value(forKey: LocalStorageKeys.devicePushId.rawValue) as? Int
        }
        set {
            UserDefaults.shared.set(newValue, forKey: LocalStorageKeys.devicePushId.rawValue)
        }
    }
    
}
