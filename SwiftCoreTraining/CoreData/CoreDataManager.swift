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
    
    static let shared = CoreDataManager.init(modelFileName: "DatabaseOne"){}
    
    private var coordinator: NSPersistentStoreCoordinator
    private var model: NSManagedObjectModel
    public  var context: NSManagedObjectContext
    private var container: NSPersistentContainer
    
    init(modelFileName: String, completion: @escaping () -> ()) {
        
        let modelURL = Bundle.main.url(forResource: modelFileName, withExtension: "momd")!
        model = NSManagedObjectModel(contentsOf: modelURL)!
        
        coordinator = NSPersistentStoreCoordinator(managedObjectModel: model)
        
        context = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        context.persistentStoreCoordinator = coordinator
        
      
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let docURL = urls[urls.endIndex-1]
        
        /* The directory the application uses to store the Core Data store file.
         This code uses a file named "DataModel.sqlite" in the application's documents directory.
         */
        let storeURL = docURL.appendingPathComponent("DataModel.sqlite")
        do {
            try coordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: storeURL, options: nil)
        } catch {
            fatalError("Error migrating store: \(error)")
        }
        
        container = NSPersistentContainer(name: "SwiftCoreTraining")
        container.loadPersistentStores() { (description, error) in
            if let error = error {
                fatalError("Failed to load Core Data stack: \(error)")
            }
            completion()
        }
    }
    
    // MARK: - Core Data Saving support
    func saveContext () {
        let context = container.viewContext
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
        guard let firstElement = entities.first else {
            assertionFailure("Empty array exception")
            return
        }
        
        guard let entity = NSEntityDescription.entity(forEntityName: firstElement.theClassName, in: context) else {
            assertionFailure("Could not get \(firstElement.theClassName) entity description")
            return
        }
        for _ in entities {
            let _ = NSManagedObject.init(entity: entity, insertInto: context)
        }
        
        do {
            try context.save()
            completion(true)
        } catch {
            assertionFailure(error.localizedDescription)
            completion(false)
        }
    }
    
    // MARK: read operations
    func readById<T: NSManagedObject>(_ id: NSManagedObjectID) -> T? {
        do {
            let object = try context.existingObject(with: id)
            return object as? T
        } catch {
            assertionFailure(error.localizedDescription)
            return nil
        }
    }
    
    func readAllObjects<T: NSManagedObject>(_ entity: T.Type) -> [T] {
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: T.entityName)
        do {
            let objects = try context.fetch(fetchRequest) as? [T] ?? []
            return objects
        } catch {
            assertionFailure(error.localizedDescription)
            return []
        }
    }
    
    
    // MARK: delete operations
    func deleteById(_ id: NSManagedObjectID) -> Bool {
        guard let object = readById(id) else {
            return false
        }
        
        context.delete(object)
        do {
            try context.save()
        } catch {
            assertionFailure(error.localizedDescription)
        }
        
        return true
    }
    
    func deleteAll<T: NSManagedObject>(_ objectsToDelete: T.Type) {
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: T.entityClassName)
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try coordinator.execute(deleteRequest, with: context)
            try context.save()
        } catch {
            assertionFailure(error.localizedDescription)
        }
    }
    
}
