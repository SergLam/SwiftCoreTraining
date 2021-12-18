//
//  UserJSON.swift
//  SwiftCoreTraining
//
//  Created by Serhii Liamtsev on 12/18/21.
//  Copyright © 2021 Serg Liamtsev. All rights reserved.
//

import Foundation

struct UserJSON: Decodable {
    
    var id: Int
    var email: String
    var firstName: String
    var lastName: String
    var avatarLogo: String
    var nickname: String
    var gender: Gender
    var location: String
    var count: Int
    
    enum CodingKeys: String, CodingKey, CaseIterable {
        
        case id = "id"
        case email = "email"
        case firstName = "first_name"
        case lastName = "last_name"
        case avatarLogo = "avatar_logo"
        case nickname = "nickname"
        case gender = "gender"
        case location = "location"
        case count = "count"
    }
    
    init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeForce(Int.self, forKey: .id)
        email = try container.decodeIfPresentForce(String.self, forKey: .email) ?? ""
        firstName = try container.decodeIfPresentForce(String.self, forKey: .firstName) ?? ""
        lastName = try container.decodeIfPresentForce(String.self, forKey: .lastName) ?? ""
        avatarLogo = try container.decodeIfPresentForce(String.self, forKey: .avatarLogo) ?? ""
        nickname = try container.decodeIfPresentForce(String.self, forKey: .nickname) ?? ""
        
        gender = try container.decode(Gender.self, forKey: .gender)

        location = try container.decodeIfPresentForce(String.self, forKey: .location) ?? ""
        count = try container.decodeIfPresentForce(Int.self, forKey: .count) ?? 0
    }
    
    init(id: Int, email: String, firstName: String, lastName: String, avatarLogo: String, nickname: String, gender: Gender, location: String, count: Int) {
        
        self.id = id
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.avatarLogo = avatarLogo
        self.nickname = nickname
        self.gender = gender
        self.location = location
        self.count = count
    }
    
}

// MARK: - Encodable
extension UserJSON: Encodable {

    func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(email, forKey: .email)
        try container.encodeIfPresent(firstName, forKey: .firstName)
        try container.encodeIfPresent(lastName, forKey: .lastName)
        try container.encodeIfPresent(avatarLogo, forKey: .avatarLogo)
        try container.encodeIfPresent(nickname, forKey: .nickname)
        try container.encodeIfPresent(gender.rawValue, forKey: .gender)
        try container.encodeIfPresent(location, forKey: .location)
        try container.encodeIfPresent(count, forKey: .count)
    }
    
}

// MARK: - Equatable
extension UserJSON: Equatable {
    
    static func == (lhs: UserJSON, rhs: UserJSON) -> Bool {
        
        return lhs.id == rhs.id && lhs.email == rhs.email && lhs.firstName == rhs.firstName && lhs.lastName == rhs.lastName && lhs.avatarLogo == rhs.avatarLogo && lhs.nickname == rhs.nickname && lhs.gender == rhs.gender && lhs.location == rhs.location && lhs.count == rhs.count
    }
    
}

// MARK: - Equatable
extension UserJSON: Hashable {
    
    func hash(into hasher: inout Hasher) {
        
        hasher.combine(id)
    }
    
}

// MARK: - Mockable
extension UserJSON: Mockable {
    
    typealias MockType = UserJSON
    
    static func mock(isSuccess: Bool) -> UserJSON {
    
        let id: Int = Int.random(in: 0...Int.max)
        let email: String = "example\(id)@domain.com"
        let avatarLogo: String = MockDataConstants.imageUrls.randomElement() ?? MockDataConstants.imageUrls[0]
        let nickname: String = "mock_user_\(id)"
        let gender: Gender = Gender.allCases.randomElement() ?? .male
        let count: Int = Int.random(in: 0...100)
        return UserJSON(id: id, email: email, firstName: "My Mock", lastName: "User \(id)", avatarLogo: avatarLogo, nickname: nickname, gender: gender, location: "Kharkiv", count: count)
    }
}

// MARK: - JSONAble
extension UserJSON: JSONAble {
    
}

// {
//  "gender" : false,
//  "location" : null,
//  "avatar_logo" : "https:\/\/www.google.com\/storage\/photos\/5j\/k3\/D2HT2sKLztXKmkhxn5vEz2IuiI0AXWa6Gb5ubhbk.jpeg",
//  "id" : 22518,
//  "nickname" : "User Name",
//  "last_name" : "Lamcev",
//  "count" : 0,
//  "email" : "example@gmail.com",
//  "created_at" : 1597090463,
//  "client" : {
//    "is_premium" : false,
//    "postpone_subscription" : null,
//    "id" : 22521,
//    "via" : "google",
//    "expire_at" : null,
//    "newsletter" : null,
//    "gift" : null,
//    "subscription" : null,
//    "type" : "0",
//    "has_payments" : false,
//    "premium_news" : true
//  },
//  "first_name" : "Sergg"
// }
