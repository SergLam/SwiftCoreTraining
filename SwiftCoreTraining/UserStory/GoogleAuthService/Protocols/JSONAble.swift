//
//  JSONAble.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 22.02.2020.
//  Copyright © 2020 serglam. All rights reserved.
//

import Foundation
import Moya

protocol JSONAble {
    associatedtype ReturnType
    
    /**
        Convinience method for models sending via REST / Socket requests
     */
    func toJSON() -> [String: Any]
    
    func toMultipartData() -> [Moya.MultipartFormData]?
    
    /**
       Convinience method for models initializing while sending it via notifications (NSNotification -> userInfo - [AnyHashable: Any])
    */
    static func fromJSON(_ dictionary: [AnyHashable: Any]) -> ReturnType?
    
}

extension JSONAble {
    
    static func fromNotification(_ notification: NSNotification) -> ReturnType? {
        guard let info = notification.userInfo else {
            return nil
        }
        
        return Self.fromJSON(info)
    }
}

extension JSONAble where Self: Encodable {
    
    func toJSONString() -> String? {
        do {
            let encoder = JSONEncoder()
            encoder.outputFormatting = .sortedKeys
            let jsonData = try encoder.encode(self)
            return String(data: jsonData, encoding: .utf8)
        } catch {
            assertionFailure(error.localizedDescription)
            // ErrorLoggerService.logWithTrace(error.localizedDescription)
            return nil
        }
    }
    
}
