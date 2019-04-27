//
//  CoreDataManager.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 4/20/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import Foundation
import CoreData

class CoreDataManager: NSObject {
    
    static let shared = CoreDataManager.init{}
    
    var coordinator: NSPersistentStoreCoordinator
    var model: NSManagedObjectModel
    var managedObjectContext: NSManagedObjectContext
    var persistentContainer: NSPersistentContainer
    
    init(completion: @escaping () -> ()) {
        model = NSManagedObjectModel()
        coordinator = NSPersistentStoreCoordinator(managedObjectModel: model)
        
        managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = coordinator
        
        persistentContainer = NSPersistentContainer(name: "DatabaseOne")
        persistentContainer.loadPersistentStores() { (description, error) in
            if let error = error {
                fatalError("Failed to load Core Data stack: \(error)")
            }
            completion()
        }
    }
    
    // MARK: - Core Data Saving support
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                assert(false, "Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
}

// MARK: Methods for core data operations
extension CoreDataManager {
    
    func write<T: NSManagedObject>(shouldUpdate: Bool, entities: [T.Type], completion: @escaping (Bool) -> (Void)) {
        guard let entity = entities.first else {
            assert(false, "Empty array exception")
            return
        }
        
        let entityName = String(describing: entity)
        for _ in entities {
            let _ = NSEntityDescription.insertNewObject(forEntityName: entityName, into: managedObjectContext) as! T
        }
        
        do {
            try managedObjectContext.save()
            completion(true)
        } catch {
            assertionFailure(error.localizedDescription)
            completion(false)
        }
    }
    
    func read() {
        
    }
    
    func readAll() {
        
    }
    
    func delete() {
        
    }
    
    func deleteAll() {
        
    }
}
