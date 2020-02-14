//
//  RealmDAO.swift
//  SwiftCoreTraining
//
//  Created by Andrii Mazepa on 14.02.2020.
//  Copyright © 2020 serglam. All rights reserved.
//

import Foundation
import RealmSwift// pod 'RealmSwift', '~> 4.3.0'

// NOTE: - RealmDAO.configureMigration() - call this method before first call to the database in your app.
// E.g. at the app delegate init method
final class RealmDAO {
    
    static let shared = RealmDAO()
    
    static let currentSchemaVersion: UInt64 = RealmDAO.getCurrentDatabaseVersion() + 1
    
    /**
    IMPORTANT: This realm instance should be used only for initial app creation + migration process.
    For data CRUD operations - create a new thread-safe Realm instance because of thread crash issues.
     // https://github.com/realm/realm-cocoa/issues/4944
     */
    lazy var realm: Realm = {
        do {
            return try Realm()
        } catch {
            let message = "Unable to create realm instance \(error.localizedDescription)"
            // ErrorLoggerService.logWithTrace(.error(errorMessage: message))
            preconditionFailure(message)
        }
    }()
    
    /**
    Get this configuration each time when you need to perform CRUD operation
     */
    var configuration: Realm.Configuration {
        return realm.configuration
    }
    
    private init() {
        
    }
    
    // MARK: - Base CRUD operations implemented with generics
    /**
       Use to write NEW UNMANAGED objects to database
    */
    func writeUnsafe<T: Object>(value: [T]) {
        do {
            try realm.write {
                realm.add(value, update: .all)
            }
        } catch {
            let message = "\(error.localizedDescription)"
            // ErrorLoggerService.logWithTrace(.error(errorMessage: message))
        }
    }
    
    /**
        Use to write in background for already existing objects in database
     */
    func write<T: Object>(value: [T]) {
        
        for obj in value {
            realm.writeAsync(obj: obj, block: { realm, obj in
                guard let objReference = obj else { return }
                realm.add(objReference, update: .all)
            })
        }
    }
    
    func readAll<T: Object>(object: T.Type) -> [T] {
        do {
            let realm = try Realm(configuration: configuration)
            let result = realm.objects(T.self)
            return Array(result)
        } catch {
            let message = "Unable to create realm instance \(error.localizedDescription)"
            // ErrorLoggerService.logWithTrace(.error(errorMessage: message))
            preconditionFailure(message)
        }
    }
    
    func readAllResult<T: Object>(object: T.Type) -> Results<T> {
        do {
            let realm = try Realm(configuration: configuration)
            return realm.objects(T.self)
        } catch {
            let message = "Unable to create realm instance \(error.localizedDescription)"
            // ErrorLoggerService.logWithTrace(.error(errorMessage: message))
            preconditionFailure(message)
        }
    }
    
    func deleteAll<T: Object>(_ class: T.Type) {
        do {
            let realm = try Realm(configuration: configuration)
            let allObjects = realm.objects(T.self)
            try realm.write { realm.delete(allObjects) }
        } catch {
            let message = "Unable to create realm instance \(error.localizedDescription)"
            // ErrorLoggerService.logWithTrace(.error(errorMessage: message))
        }
    }
    
    func delete<T: Object>(value: [T]) {
        do {
            let realm = try Realm(configuration: configuration)
            try realm.write { realm.delete(value) }
        } catch {
            let message = "Unable to create realm instance \(error.localizedDescription)"
            // ErrorLoggerService.logWithTrace(.error(errorMessage: message))
        }
    }
    
    func update<T: Object>(value: [T]) {
        do {
            let realm = try Realm(configuration: configuration)
            try realm.write { realm.add(value, update: .modified) }
        } catch {
            let message = "Unable to create realm instance \(error.localizedDescription)"
            // ErrorLoggerService.logWithTrace(.error(errorMessage: message))
        }
    }
    
    func deleteAllRecords() {
        
        // NOTE: Clean up your database.
        // Usefull for user log out actions and ect.
        // RealmDAO.shared.deleteAll(Chat.self)
        // RealmDAO.shared.deleteAll(Message.self)
        // RealmDAO.shared.deleteAll(User.self)
    }
    
}

// MARK: - Database migration functionality
extension RealmDAO {
    
    static func configureMigration() {
        let config = Realm.Configuration(schemaVersion: currentSchemaVersion, migrationBlock: { _, oldSchemaVersion in
           // We haven’t migrated anything yet, so oldSchemaVersion == 0
            if oldSchemaVersion < 1 {
                // NOTE: This is lightweight_migration realm migration
                // https://medium.com/@shenghuawu/realm-lightweight-migration-4559b9920487
                // Nothing to do!
                // Realm will automatically detect new properties and removed properties
                // And will update the schema on disk automatically
            }
            // NOTE: This is heavyweight_migration realm migration
            // https://github.com/ShengHuaWu/RealmMigration/blob/master/RealmMigration/DataStore.swift
            // https://realm.io/docs/swift/latest/#migrations
        })
        Realm.Configuration.defaultConfiguration = config
    }
    
    private static func getCurrentDatabaseVersion() -> UInt64 {
        
        let configCheck = Realm.Configuration()
        guard let fileURL = configCheck.fileURL else {
            // ErrorLoggerService.logWithTrace(.error(errorMessage: "Unable to get file url"))
            return UInt64(0)
        }
        do {
            let lastSchemaVersion = try schemaVersionAtURL(fileURL)
            return lastSchemaVersion
        } catch {
            // Realm file doesn't exist - realm initial setup
            return UInt64(0)
        }
    }
    
    private func isMigrationRequired() -> Bool {
        
        let lastSchemaVersion = RealmDAO.getCurrentDatabaseVersion()
        return RealmDAO.currentSchemaVersion < lastSchemaVersion
    }
    
    private func deleteDatabase() {
        let configuration = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
        Realm.Configuration.defaultConfiguration = configuration
    }
    
}
