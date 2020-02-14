//
//  PredicateBuilder.swift
//  SwiftCoreTraining
//
//  Created by Andrii Mazepa on 14.02.2020.
//  Copyright © 2020 serglam. All rights reserved.
//

import Foundation

final class PredicateBuilder {
    
    // MARK: field names - equal to realm Object fields names
    static let chatIdFieldName = "chatId"
    
    static let messageIdFieldName = "id"
    
    static let messagePredicate = PredicateBuilder.equalityPredicate(messageIdFieldName, 101)
    
    static let messagePredicateFormat = "\(PredicateBuilder.chatIdFieldName) == %@ AND \(PredicateBuilder.messageIdFieldName) == %@"
    
    // MARK: - Predicate creation methods
    static func equalityPredicate(_ fieldName: String, _ value: Any) -> NSPredicate {
        return NSPredicate(format: "\(fieldName) == %@", argumentArray: [value])
    }
    
    static func notEqualPredicate(_ fieldName: String, _ value: Any) -> NSPredicate {
        return NSPredicate(format: "\(fieldName) != %@", argumentArray: [value])
    }
    
    static func buildPredicate(_ format: String, _ value: [Any]) -> NSPredicate {
        return NSPredicate(format: format, argumentArray: value)
    }
    
    static func nilPredicate(_ fieldName: String) -> NSPredicate {
        return NSPredicate(format: "\(fieldName) == nil")
    }
    
}
