//
//  Environment.swift
//  SwiftCoreTraining
//
//  Created by Serhii Liamtsev on 12/18/21.
//  Copyright © 2021 Serg Liamtsev. All rights reserved.
//

import Foundation

private enum UserDefinedKeys: String, CaseIterable {
    
    // MARK: - Base URL keys
    case REST_BASE_URL = "REST_BASE_URL"
    case REST_DOMAIN_NAME = "REST_DOMAIN_NAME"
    case REST_IP_ADDRESS = "REST_IP_ADDRESS"
    
    case STORAGE_BASE_URL = "STORAGE_BASE_URL"
    case NOMINATIM_BASE_URL = "NOMINATIM_BASE_URL"
    
    case MANAGE_SUBSCRIPTIONS_URL = "MANAGE_SUBSCRIPTIONS_URL"
    case TERMS_URL = "TERMS_URL"
    case PRIVACY_URL = "PRIVACY_URL"
    case ITUNES_APP_URL = "ITUNES_APP_URL"
    
    // MARK: - Error & bugs reporting SDK Key
    case BUGFENDER_API_KEY = "BUGFENDER_API_KEY"
    case INSTABUG_API_KEY = "INSTABUG_API_KEY"

    // MARK: - Google API Keys
    case GOOGLE_CLIENT_ID = "GOOGLE_CLIENT_ID"
    case GOOGLE_API_KEY = "GOOGLE_API_KEY"
    
    case GOOGLE_ANALYTICS_TRACK_ID = "GOOGLE_ANALYTICS_TRACK_ID"

    // MARK: - Analytics SDK
    case ADJUST_SDK_API_KEY = "ADJUST_SDK_API_KEY"
    case SEGMENT_IO_API_KEY = "SEGMENT_IO_API_KEY"
    
    // MARK: - Payments SDK
    case STRIPE_API_KEY_PROD = "STRIPE_API_KEY_PROD"
    case STRIPE_API_KEY_TEST = "STRIPE_API_KEY_TEST"
    
}

 enum Environment {
    
    private static let dictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            preconditionFailure("Plist file not found")
        }
        return dict
    }()
    
    static let bundleId: String = {
        guard let bundleId = Bundle.main.bundleIdentifier else {
            preconditionFailure("Unable to get bundle id")
        }
        return bundleId
    }()
    
    static let appVersion: String = {
        guard let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String else {
            preconditionFailure("Unable to get app version number")
        }
        return appVersion
    }()
    
    static let appBuildNumber: String = {
        guard let buildNumber = Bundle.main.infoDictionary?["CFBundleVersion"] as? String else {
            preconditionFailure("Unable to get app build number")
        }
        return buildNumber
    }()
    
    // MARK: Base URL
    static let restBaseURL: URL = {
        guard let rootURLstring = Environment.dictionary[UserDefinedKeys.REST_BASE_URL.rawValue] as? String else {
            preconditionFailure("URL not set in plist for this environment")
        }
        guard let url = URL(string: rootURLstring) else {
            preconditionFailure("URL is invalid")
        }
        return url
    }()
    
    static let restDomainName: String = {
        guard let string = Environment.dictionary[UserDefinedKeys.REST_DOMAIN_NAME.rawValue] as? String else {
            preconditionFailure("String not set in plist for this environment")
        }
        return string
    }()
    
    static let restIpAddress: String = {
        guard let string = Environment.dictionary[UserDefinedKeys.REST_IP_ADDRESS.rawValue] as? String else {
            preconditionFailure("String not set in plist for this environment")
        }
        return string
    }()
    
    static let storageBaseURL: URL = {
        guard let rootURLstring = Environment.dictionary[UserDefinedKeys.STORAGE_BASE_URL.rawValue] as? String else {
            preconditionFailure("URL not set in plist for this environment")
        }
        guard let url = URL(string: rootURLstring) else {
            preconditionFailure("URL is invalid")
        }
        return url
    }()
    
    static let nominatimBaseURL: URL = {
        guard let rootURLstring = Environment.dictionary[UserDefinedKeys.NOMINATIM_BASE_URL.rawValue] as? String else {
            preconditionFailure("URL not set in plist for this environment")
        }
        guard let url = URL(string: rootURLstring) else {
            preconditionFailure("URL is invalid")
        }
        return url
    }()
    
    static let manageSubsciptionsURL: URL = {
        guard let rootURLstring = Environment.dictionary[UserDefinedKeys.MANAGE_SUBSCRIPTIONS_URL.rawValue] as? String else {
            preconditionFailure("URL not set in plist for this environment")
        }
        guard let url = URL(string: rootURLstring) else {
            preconditionFailure("URL is invalid")
        }
        return url
    }()
    
    static let termsURL: URL = {
        guard let rootURLstring = Environment.dictionary[UserDefinedKeys.TERMS_URL.rawValue] as? String else {
            preconditionFailure("URL not set in plist for this environment")
        }
        guard let url = URL(string: rootURLstring) else {
            preconditionFailure("URL is invalid")
        }
        return url
    }()
    
    static let privacyURL: URL = {
        guard let rootURLstring = Environment.dictionary[UserDefinedKeys.PRIVACY_URL.rawValue] as? String else {
            preconditionFailure("URL not set in plist for this environment")
        }
        guard let url = URL(string: rootURLstring) else {
            preconditionFailure("URL is invalid")
        }
        return url
    }()
    
    static let itunesAppURL: URL = {
        guard let rootURLstring = Environment.dictionary[UserDefinedKeys.ITUNES_APP_URL.rawValue] as? String else {
            preconditionFailure("URL not set in plist for this environment")
        }
        guard let url = URL(string: rootURLstring) else {
            preconditionFailure("URL is invalid")
        }
        return url
    }()
    
    // MARK: - Error & bugs reporting SDK Key
    static let bugfenderKey: String = {
        guard let string = Environment.dictionary[UserDefinedKeys.BUGFENDER_API_KEY.rawValue] as? String else {
            preconditionFailure("String not set in plist for this environment")
        }
        return string
    }()
    
    static let instabugKey: String = {
        guard let string = Environment.dictionary[UserDefinedKeys.INSTABUG_API_KEY.rawValue] as? String else {
            preconditionFailure("String not set in plist for this environment")
        }
        return string
    }()
    
    // MARK: - Google API Keys
    static let googleClientId: String = {
        guard let string = Environment.dictionary[UserDefinedKeys.GOOGLE_CLIENT_ID.rawValue] as? String else {
            preconditionFailure("String not set in plist for this environment")
        }
        return string
    }()
    
    static let googleApiKey: String = {
        guard let string = Environment.dictionary[UserDefinedKeys.GOOGLE_API_KEY.rawValue] as? String else {
            preconditionFailure("String not set in plist for this environment")
        }
        return string
    }()
    
    static let googleAnalyticsTrackId: String = {
        guard let string = Environment.dictionary[UserDefinedKeys.GOOGLE_ANALYTICS_TRACK_ID.rawValue] as? String else {
            preconditionFailure("String not set in plist for this environment")
        }
        return string
    }()
    
    // MARK: - Analytics SDK
    static let adjustSdkApiKey: String = {
        guard let string = Environment.dictionary[UserDefinedKeys.ADJUST_SDK_API_KEY.rawValue] as? String else {
            preconditionFailure("String not set in plist for this environment")
        }
        return string
    }()
    
    static let segmentIOApiKey: String = {
        guard let string = Environment.dictionary[UserDefinedKeys.SEGMENT_IO_API_KEY.rawValue] as? String else {
            preconditionFailure("String not set in plist for this environment")
        }
        return string
    }()
    
    // MARK: - Payments SDK
    static let stripeApiKeyProd: String = {
        guard let string = Environment.dictionary[UserDefinedKeys.STRIPE_API_KEY_PROD.rawValue] as? String else {
            preconditionFailure("String not set in plist for this environment")
        }
        return string
    }()
    
    static let stripeApiKeyTest: String = {
        guard let string = Environment.dictionary[UserDefinedKeys.STRIPE_API_KEY_TEST.rawValue] as? String else {
            preconditionFailure("String not set in plist for this environment")
        }
        return string
    }()
    
    // MARK: - Mock API flag
    static var isMockApi: Bool {
        guard let arg = ProcessInfo.processInfo.environment["MOCK_API"] else {
            return false
        }
        return arg == "true"
    }
    
    static var isMockApiStubSuccess: Bool {
        guard let arg = ProcessInfo.processInfo.environment["MOCK_API_SUCCESS"] else {
            return true
        }
        return arg == "true"
    }
    
}
