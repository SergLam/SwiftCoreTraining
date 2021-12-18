//
//  LocalStorageKeys.swift
//  SwiftCoreTraining
//
//  Created by Serhii Liamtsev on 12/18/21.
//  Copyright © 2021 Serg Liamtsev. All rights reserved.
//

import Foundation

enum LocalStorageKeys: String, CaseIterable {
    
    // MARK: - Authorization parameters keys
    case isLogin = "auth.user.isAuthorized"
    
    case tokenExpirationDate = "auth.token.expiredAt"
    
    case refreshTokenExpirationDate = "auth.token.refreshExpiredAt"
    
    case userProfile = "auth.user.profile"
    
    // MARK: - User data updates keys
    case appAlreadyRated = "user.appAlreadyRated"
    
    case isFirstLaunch = "user.isFirstLaunch"
    
    // MARK: - Current app version
    /// Use for user defaults migration
    case currentVersionNumber = "settings.currentAppVersion"
    
    /// Use for app interface language change
    case selectedLocaleCode = "settings.localeCode"
    
    // MARK: - Push notifications
    case isNotificationsEnabled = "user.settings.isNotificationsEnabled"
    
    case deviceToken = "deviceToken"
    case devicePushId = "devicePushId"
}
