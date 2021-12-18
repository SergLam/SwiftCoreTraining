//
//  Gender.swift
//  SwiftCoreTraining
//
//  Created by Serhii Liamtsev on 12/18/21.
//  Copyright © 2021 Serg Liamtsev. All rights reserved.
//

import Foundation

@objc
enum Gender: Int, CaseIterable, Codable {
    
    case male = 1
    case female = 2
    case none = 3
    
    var title: String {
        switch self {
        case .male:
            return "Male"
        case .female:
            return "Female"
        case .none:
            return "None"
        }
    }
    
    static var visibleItems: [Gender] {
        return [.male, .female]
    }
    
}
