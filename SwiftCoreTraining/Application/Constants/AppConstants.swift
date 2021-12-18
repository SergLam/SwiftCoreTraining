//
//  AppConstants.swift
//  SwiftCoreTraining
//
//  Created by Serhii Liamtsev on 12/18/21.
//  Copyright © 2021 Serg Liamtsev. All rights reserved.
//

import UIKit

struct AppConstants {
    
    // MARK: - App specific constants
    static var appID: String {
        return "1442200920"
    }
    
    static let nominatimSearchDebounceTime: DispatchTimeInterval = DispatchTimeInterval.milliseconds(500)
    
    // MARK: - Networking constants
    static let requestTimeOutTimeInterval: TimeInterval = 30.0
    static let fileDownloadRequestTimeOutTimeInterval: TimeInterval = TimeInterval.halfHour
    
    static let dateDecodingFormat: JSONDecoder.DateDecodingStrategy = .secondsSince1970
    static let dateEncodingFormat: JSONEncoder.DateEncodingStrategy = .secondsSince1970
    
    static let meditationDateDecodingFormat: JSONDecoder.DateDecodingStrategy = .formatted(DateFormatter.miliSecondsUTCPlus3)
    static let meditationDateEncodingFormat: JSONEncoder.DateEncodingStrategy =
        .formatted(DateFormatter.miliSecondsUTCPlus3)
    
    static let notificationScheduleDateDecodingFormat: JSONDecoder.DateDecodingStrategy = .formatted(DateFormatter.hourMinuteSeconds)
    static let notificationScheduleEncodingFormat: JSONEncoder.DateEncodingStrategy =
        .formatted(DateFormatter.hourMinuteSeconds)
    
    static let dateDecodingFormatSeconds: JSONDecoder.DateDecodingStrategy = .secondsSince1970
    static let dateEncodingFormatSeconds: JSONEncoder.DateEncodingStrategy = .secondsSince1970
    
    static let payPaldateDecodingFormat: JSONDecoder.DateDecodingStrategy = .formatted(DateFormatter.iso8601Seconds)
    static let payPaldateEncodingFormat: JSONEncoder.DateEncodingStrategy = .formatted(DateFormatter.iso8601Seconds)
    
    static let dateFormat: DateFormatter = DateFormatter.iso8601Miliseconds
    static let birthDayDateFormat: DateFormatter = DateFormatter.dateOfBirth
    
    static let imageCompression: CGFloat = 1.0
    
    static let tokenLiveTime: TimeInterval = 3600.0
    
    static let refreshTokenLiveTime: TimeInterval = 3600.0 * 24 * 30
    
    // MARK: - UI Constants
    static let defaultToastDuration: TimeInterval = 2.0
    
    // MARK: - Sign in flow constants
    static let minPasswordLength: Int = 8
    
    static let userNameMinLength: Int = 3
    static let userNameMaxLength: Int = 32
    
    static let emailMaxLength: Int = 320
    
    // MARK: - Content sharing constants
    static func whatsAppSharingURL(for text: String) -> URL? {
        
        let fullUrl = "whatsapp://send?text=\(text)"
        guard let urlEncoded = fullUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            return nil
        }
        guard let whatsAppURL = URL(string: urlEncoded) else {
            return nil
        }
        return whatsAppURL
    }
    
    // MARK: - Test constants
    static let dummyText: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut faucibus faucibus leo in placerat. Nunc in neque at sem dictum iaculis vel ut nunc. Duis id tincidunt quam. Suspendisse sed lacus vel neque volutpat congue. In hac habitasse platea dictumst. Cras posuere bibendum tortor sed luctus. Sed sed velit finibus, tincidunt nisi et, ultrices orci."
    
    static let previewDevices: [String] = ["iPhone SE (1st generation)"]// ["iPhone SE (1st generation)", "iPhone 8 (14.3)", "iPhone 12", "iPhone 12 Pro Max"]
    
    static let previewBigDevice: [String] = ["iPhone 12 Pro Max"]
    
}
