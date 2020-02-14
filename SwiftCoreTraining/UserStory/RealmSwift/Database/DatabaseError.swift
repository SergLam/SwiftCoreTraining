//
//  DatabaseError.swift
//  SwiftCoreTraining
//
//  Created by Andrii Mazepa on 14.02.2020.
//  Copyright © 2020 serglam. All rights reserved.
//

import Foundation

enum DatabaseError: Error, LocalizedError {
    
    case databaseAlreadyInWriteTransaction
    
    var description: String {
        switch self {
        case .databaseAlreadyInWriteTransaction:
            return "Database already in a write transaction."
        }
    }
    
     var errorDescription: String? {
        return self.description
    }
    
}
