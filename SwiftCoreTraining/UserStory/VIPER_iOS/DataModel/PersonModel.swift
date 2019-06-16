//
//  UserModel.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 6/16/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import Foundation

class PersonModel: Codable {
    
    let id: Int
    let firstName: String
    let lastName: String
    
    init(id: Int, fName: String, lName: String) {
        self.id = id
        self.firstName = fName
        self.lastName = lName
    }
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case firstName = "first_name"
        case lastName = "last_name"
    }
    
    required init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        firstName = try container.decode(String.self, forKey: .firstName)
        lastName = try container.decode(String.self, forKey: .lastName)
    }
    
    func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(firstName, forKey: .firstName)
        try container.encode(lastName, forKey: .lastName)
    }
}
