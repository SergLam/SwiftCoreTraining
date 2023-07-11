//
//  Data+Ext.swift
//  SwiftCoreTraining
//
//  Created by Serhii Liamtsev on 7/11/23.
//  Copyright © 2023 Serg Liamtsev. All rights reserved.
//

import Foundation

extension Data {
    
    func hexString() -> String {
        return self.map { String(format: "%02.2hhx", $0) }.joined()
    }
    
    /**
     Return OLD-style token like '<ce8be627 2e43e855 16033e24 b4c28922 0eeda487 9c477160 b2545e95 b68b5969>'
     */
    func deviceTokenStringOld() -> String {
        return self.map { String(format: "%02x", $0) }.joined()
    }
    
    var prettyPrintedJSONString: String? {
        
        let options: JSONSerialization.WritingOptions
        
        if #available(iOS 13.0, *) {
            
            options = [.prettyPrinted, .sortedKeys, .withoutEscapingSlashes]
            
        } else {
            
            options = [.prettyPrinted, .sortedKeys]
        }
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
            let data = try? JSONSerialization.data(withJSONObject: object, options: options),
            let prettyPrintedString = String(data: data, encoding: String.Encoding.utf8) else { return nil }
        
        return prettyPrintedString
    }
    
    var convertToDictionary: [String: Any]? {
        do {
            return try JSONSerialization.jsonObject(with: self, options: []) as? [String: Any]
        } catch {
            // TODO: - Log error here
            return nil
        }
    }
    
}
