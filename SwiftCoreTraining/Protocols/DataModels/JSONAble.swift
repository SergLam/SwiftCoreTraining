//
//  JSONAble.swift
//  SwiftCoreTraining
//
//  Created by Serhii Liamtsev on 12/18/21.
//  Copyright © 2021 Serg Liamtsev. All rights reserved.
//

import Foundation

public protocol JSONAble where Self: Codable {
    
    func toJSON() -> [String: Any]
    static func fromJSON(_ dictionary: [AnyHashable: Any]) -> Self?
}

extension JSONAble {
    
    public func toJSON() -> [String: Any] {
        let jsonEncoder = JSONEncoder()
        if let jsonData = try? jsonEncoder.encode(self),
           let jsonString = String(data: jsonData, encoding: String.Encoding.utf8),
           let jsonDict = jsonString.toDictionary() {
            return jsonDict
        }
        return [:]
    }
    
    public static func fromJSON(_ dictionary: [AnyHashable: Any]) -> Self? {
        if let data = try? JSONSerialization.data(withJSONObject: dictionary, options: []),
           let result = try? fromData(data) {
            return result
        }
        return nil
    }
    
    public static func fromData(_ data: Data) throws -> Self {
        let decoder = JSONDecoder()
        do {
            let object = try decoder.decode(Self.self, from: data)
            return object
        } catch {
            print("Decode \(String(describing: self)) error")
            throw error
        }
    }
}

extension JSONAble {
    
    public func toDataUpdate() -> DataUpdateInfo {
        return [String(describing: Self.Type.self): self.toJSON()]
    }
    
    public static func fromDataUpdate(_ data: DataUpdateInfo) -> Self? {
        guard let dict = data[String(describing: Self.Type.self)] else {
            return nil
        }
        return Self.fromJSON(dict)
    }
    
}

extension String {
    
    public func toDictionary() -> [String: Any]? {
       if let data = self.data(using: .utf8) {
           do {
               let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any]
               return json
           } catch {
            print("Encode \(String(describing: self)) error")
           }
       }
       return nil
   }
    
}
