//
//  Codable+Force.swift
//  SwiftCoreTraining
//
//  Created by Serhii Liamtsev on 12/18/21.
//  Copyright © 2021 Serg Liamtsev. All rights reserved.
//

import Foundation

extension KeyedDecodingContainer {

    /**
       Use to decode Int values using JS logic ["0", "1", 0, 1]
    */
    func decodeForce(_ type: Int.Type, forKey key: KeyedDecodingContainer<K>.Key) throws -> Int {
        
        let error: Error = generateError(type: String(describing: Int.self), forKey: key)
        // First try to decode it as a regular Int
        let intValue = try? self.decode(Int.self, forKey: key)
        if let int = intValue {
            return int
        }
        // Then try to decode it as string value
        let stringValue = try? self.decode(String.self, forKey: key)
        
        // Check all the above values
        if let string = stringValue, let intFromStr = Int(string) {
            return intFromStr
        // In case of empty string return zero value
        } else if let string = stringValue, string.isEmpty {
            return 0
        } else {
            throw error
        }
    }
    
    func decodeForce(_ type: Date.Type, forKey key: KeyedDecodingContainer<K>.Key) throws -> Date {
        
        let error: Error = generateError(type: String(describing: Date.self), forKey: key)
        // First try to decode it as a regular Int
        let value = try? self.decode(Date.self, forKey: key)
        if let date = value {
            return date
        } else {
            throw error
        }
    }
    
    func decodeForce(_ type: String.Type, forKey key: KeyedDecodingContainer<K>.Key) throws -> String {
        
        let error: Error = generateError(type: String(describing: String.self), forKey: key)
        
        // First try to decode it as a regular Int
        let value = try? self.decode(String.self, forKey: key)
        if let str = value {
            return str
        } else {
            throw error
        }
    }
    
    func decodeForce(_ type: Double.Type, forKey key: KeyedDecodingContainer<K>.Key) throws -> Double {
                
        let error: Error = generateError(type: String(describing: Double.self), forKey: key)

        // First try to decode it as a regular Int
        let doubleValue = try? self.decode(Double.self, forKey: key)
        if let double = doubleValue {
            return double
        }
        
        // Then try to decode it as string value
        let stringValue = try? self.decode(String.self, forKey: key)
        // Check all the above values
        if let string = stringValue, let intFromStr = Double(string) {
            return intFromStr
            
        // In case of empty string return zero value
        } else if let string = stringValue, string.isEmpty {
            return 0
        } else {
            throw error
        }
    }
    
    /**
        Use to decode Bool values using JS logic ["true", "false", "0", "1", 0, 1, true, false]
     */
    func decodeForce(_ type: Bool.Type, forKey key: KeyedDecodingContainer<K>.Key) throws -> Bool {
        
        let error: Error = generateError(type: String(describing: Bool.self), forKey: key)
        
        // First try to decode it as a regular Bool -  true, false
        let boolValue = try? self.decode(Bool.self, forKey: key)
        if let bool = boolValue {
            return bool
        }
        
        // Then try to decode it as int value - 0, 1
        let intValue = try? self.decode(Int.self, forKey: key)
        // Then try to decode it as string value - "true", "false", "0", "1",
        let stringValue = try? self.decode(String.self, forKey: key)
        
        // Check all the above values
        if let int = intValue, int == 0 || int == 1 {
            return int == 1
        } else if let string = stringValue {
            
            // "true", "false", "0", "1",
            if string.count == 1 {
                
                // "0", "1"
                guard let intFromStr = Int(string) else {
                    throw error
                }
                return intFromStr == 1
                
            } else {
                
                switch string {
                case "true":
                    return true
                case "false":
                    return false
                default:
                    throw error
                }
                
            }
            
        } else {
            throw error
        }
    }
    
    func decodeIfPresentForce(_ type: Bool.Type, forKey key: K) throws -> Bool? {
        guard contains(key) else {
            return nil
        }
        guard try decodeNil(forKey: key) == false else {
            return nil
        }
        return try decodeForce(type, forKey: key)
    }
    
    func decodeIfPresentForce(_ type: Int.Type, forKey key: K) throws -> Int? {
        guard contains(key) else {
            return nil
        }
        guard try decodeNil(forKey: key) == false else {
            return nil
        }
        return try decodeForce(type, forKey: key)
    }
    
    func decodeIfPresentForce(_ type: Double.Type, forKey key: K) throws -> Double? {
        guard contains(key) else {
            return nil
        }
        guard try decodeNil(forKey: key) == false else {
            return nil
        }
        return try decodeForce(type, forKey: key)
    }
    
    func decodeIfPresentForce(_ type: String.Type, forKey key: K) throws -> String? {
        guard contains(key) else {
            return nil
        }
        guard try decodeNil(forKey: key) == false else {
            return nil
        }
        return try decodeForce(type, forKey: key)
    }
    
    func decodeIfPresentForce(_ type: Date.Type, forKey key: K) throws -> Date? {
        guard contains(key) else {
            return nil
        }
        guard try decodeNil(forKey: key) == false else {
            return nil
        }
        return try decodeForce(type, forKey: key)
    }
    
    // MARK: - Error generation
    private func generateError(type: String, forKey key: KeyedDecodingContainer<K>.Key) -> Error {
        
        #if DEBUG
        let error = CodingError.unableToDecode(key: key.stringValue, type: type)
        #elseif ADHOC
        let error = CodingError.unableToDecode(key: key.stringValue, type: type)
        #elseif RELEASE
        let error = CodingError.unableToDecode(key: key.stringValue, type: type)
        #else
        let message: String = "Authorization error"
        let error = AuthError.serverError(failureReason: message)
        #endif
        return error
    }
    
}
