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
    
    private var coordinator: NSPersistentStoreCoordinator
    private var model: NSManagedObjectModel
    var managedObjectContext: NSManagedObjectContext
    private var persistentContainer: NSPersistentContainer
    
    init(completion: @escaping () -> ()) {
        let modelURL = Bundle.main.url(forResource: "DatabaseOne", withExtension: "momd")!
        model = NSManagedObjectModel(contentsOf: modelURL)!
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
    
    // MARK: create and update opetations
    func write<T: NSManagedObject>(shouldUpdate: Bool, entities: [T], completion: @escaping (Bool) -> (Void)) {
        
        let entityName = T.entity().managedObjectClassName ?? ""
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
    
    // MARK: read operations
    func readById<T: NSManagedObject>(_ id: NSManagedObjectID) -> T? {
        do {
            let object = try managedObjectContext.existingObject(with: id)
            return object as? T
        } catch {
            assertionFailure(error.localizedDescription)
            return nil
        }
    }
    
    func readAllObjects<T: NSManagedObject>(_ entity: T.Type) -> [T] {
        var objects  = [T]()
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: T.entity().managedObjectClassName)
        do {
            objects = try managedObjectContext.fetch(fetchRequest) as? [T] ?? []
        } catch {
            assertionFailure(error.localizedDescription)
        }
        return objects
    }
    
    
    // MARK: delete operations
    func deleteById(_ id: NSManagedObjectID) -> Bool {
        guard let object = readById(id) else {
            return false
        }
        
        managedObjectContext.delete(object)
        do {
            try managedObjectContext.save()
        } catch {
            assertionFailure(error.localizedDescription)
        }
        
        return true
    }
    
    func deleteAll<T: NSManagedObject>(_ objectsToDelete: T.Type) {
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: T.entity().managedObjectClassName)
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try coordinator.execute(deleteRequest, with: managedObjectContext)
            try managedObjectContext.save()
        } catch {
            assertionFailure(error.localizedDescription)
        }
    }
    
}
