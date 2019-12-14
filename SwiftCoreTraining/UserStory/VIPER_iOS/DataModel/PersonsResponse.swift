//
//  PersonsResponse.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 6/16/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import Foundation

final class PersonResponse: Codable {
    
    let status: Bool
    let users: [PersonModel]
    
    enum CodingKeys: String, CodingKey {
        
        case status = "success"
        case users = "users_list"
    }
    
    required init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        status = try container.decode(Bool.self, forKey: .status)
        users = try container.decode([PersonModel].self, forKey: .users)
    }
    
    func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(status, forKey: .status)
        try container.encode(users, forKey: .users)
    }
}
