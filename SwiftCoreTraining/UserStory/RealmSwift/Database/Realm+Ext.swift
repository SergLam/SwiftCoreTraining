//
//  Realm+Ext.swift
//  SwiftCoreTraining
//
//  Created by Andrii Mazepa on 14.02.2020.
//  Copyright © 2020 serglam. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

extension Realm {
    
    /**
     // https://github.com/realm/realm-cocoa/issues/4511
      Terminating app due to uncaught exception 'RLMException', reason: 'The Realm is already in a write transaction'
     */
    func safeWrite(_ block: (() throws -> Void)) throws {
           if isInWriteTransaction {
               try block()
           } else {
               try write(block)
           }
    }
    
    // NOTE: Implementation from original documentation
    // https://realm.io/docs/swift/latest/#passing-instances-across-threads
    /**
        Thread-safe writing to the Realm
    */
    func writeAsync<T: ThreadConfined>(obj: T, errorHandler: @escaping ((_ error: Swift.Error) -> Void) = { _ in return }, block: @escaping ((Realm, T?) -> Void)) {
        
        guard RealmDAO.shared.realm.isInWriteTransaction else {
            
            let wrappedObj = ThreadSafeReference(to: obj)
            let config = RealmDAO.shared.realm.configuration
            let backgroundQueue = DispatchQueue(label: "background.realm", qos: .background)
            backgroundQueue.async {
                autoreleasepool {
                    do {
                        let realm = try Realm(configuration: config)
                        
                        guard let obj = realm.resolve(wrappedObj) else {
                          return // obj was deleted
                        }

                        try realm.safeWrite {
                            block(realm, obj)
                        }
                    } catch {
                        errorHandler(error)
                    }
                }
            }
            return
        }
        errorHandler(DatabaseError.databaseAlreadyInWriteTransaction)
    }
    
}
