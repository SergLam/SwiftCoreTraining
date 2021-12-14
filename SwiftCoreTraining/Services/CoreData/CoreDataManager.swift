//
//  CoreDataManager.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 4/20/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import CoreData
import Foundation

typealias OperationResult = ((Bool, String) -> Void)

final class CoreDataManager: NSObject {
    
    static let shared = CoreDataManager(modelFileName: "DatabaseOne"){}
    
    private var coordinator: NSPersistentStoreCoordinator
    private var model: NSManagedObjectModel
    public  var context: NSManagedObjectContext
    private var container: NSPersistentContainer
    
    init?(modelFileName: String, completion: @escaping () -> Void) {
        
        guard let modelURL = Bundle.main.url(forResource: modelFileName, withExtension: "momd") else {
            return nil
        }
        guard let model = NSManagedObjectModel(contentsOf: modelURL) else {
            return nil
        }
        self.model = model
        
        coordinator = NSPersistentStoreCoordinator(managedObjectModel: model)
        
        context = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        context.persistentStoreCoordinator = coordinator
        
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let docURL = urls[urls.endIndex - 1]
        
        /* The directory the application uses to store the Core Data store file.
         This code uses a file named "DataModel.sqlite" in the application's documents directory.
         */
        let storeURL = docURL.appendingPathComponent("DataModel.sqlite")
        debugPrint("STORE: \(storeURL)")
        do {
            try coordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: storeURL, options: nil)
        } catch {
            fatalError("Error migrating store: \(error)")
        }
        
        container = NSPersistentContainer(name: "SwiftCoreTraining")
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Failed to load Core Data stack: \(description) \(error)")
            }
            completion()
        }
    }
    
    // MARK: - Core Data Saving support
    func saveContext(completion: @escaping (Bool) -> Void) {
        if context.hasChanges {
            do {
                try context.save()
                completion(true)
            } catch {
                assertionFailure(error.localizedDescription)
                completion(false)
            }
        } else {
            completion(true)
        }
    }
    
}

// MARK: Methods for core data operations
extension CoreDataManager {
    
    // MARK: create and update opetations
    
    func write<T: NSManagedObject>(shouldUpdate: Bool, entities: [T], completion: @escaping (Bool) -> Void) {
        saveContext(completion: { result in
            completion(result)
        })
    }
    
    // MARK: read operations
    func fetchObjects<T: NSManagedObject>(_ fieldName: String, _ fieldValue: Any, _ entity: T.Type) -> [T]? {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity.entityClassName)
        fetchRequest.predicate = NSPredicate(format: "\(fieldName) = %@", argumentArray: [fieldValue])
        do {
            let objects = try context.fetch(fetchRequest)
            return objects as? [T]
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
    func deleteObjects<T: NSManagedObject>(_ fieldName: String, _ fieldValue: Any, _ entity: T.Type, completion: @escaping OperationResult) {
        guard let objects = fetchObjects(fieldName, fieldValue, entity) else {
            completion(false, "Objects with specified parameters not found")
            return
        }
        objects.forEach { context.delete($0) }
        
        saveContext(completion: { result in
            completion(result, "Delete operation completed successfully")
        })
    }
    
    func deleteAll<T: NSManagedObject>(_ objectsToDelete: T.Type, completion: @escaping OperationResult) {
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: T.entityClassName)
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try coordinator.execute(deleteRequest, with: context)
            saveContext { result in
                completion(result, "Objects deleted successfully")
            }
        } catch {
            assertionFailure(error.localizedDescription)
            completion(false, error.localizedDescription)
        }
    }
    
}
