//
//  AuthRequest.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 22.02.2020.
//  Copyright © 2020 serglam. All rights reserved.
//

import Foundation
import Moya

struct AuthRequest: Decodable {
    
    var type: AuthType
    var token: String
    
    enum CodingKeys: String, CodingKey {
        case type = "auth_provider"
        case token = "token"
    }
    
    init(type: AuthType, token: String) {
        self.type = type
        self.token = token
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let typeRaw = try container.decode(String.self, forKey: .type)
        type = AuthType(rawValue: typeRaw) ?? .gmail
        token = try container.decode(String.self, forKey: .token)
    }
}

// MARK: - Encodable
extension AuthRequest: Encodable {
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(type.rawValue, forKey: .type)
        try container.encodeIfPresent(token, forKey: .token)
    }
    
}

// MARK: - JSONAble
extension AuthRequest: JSONAble {
    
    typealias ReturnType = AuthRequest
    
    func toJSON() -> [String: Any] {
        var result: [String: Any] = [:]
        result[CodingKeys.type.rawValue] = type.rawValue
        result[CodingKeys.token.rawValue] = token
        return result
    }
    
    static func fromJSON(_ dictionary: [AnyHashable: Any]) -> AuthRequest? {
        return nil
    }
    
    func toMultipartData() -> [Moya.MultipartFormData]? {
        return nil
    }
    
}
