//
//  NSManagedObject+Ext.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 4/28/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import CoreData
import Foundation

extension NSManagedObject {
    
    /**
     Returns class name like "MyClass"
     */
    var theClassName: String {
        return NSStringFromClass(type(of: self))
    }
    
    /**
    Use while you specified MODULE NAME for enitity
    */
    public static var entityName: String {
        let className = NSStringFromClass(self)
        let entityName = className.components(separatedBy: ".").last!
        return entityName
    }
    
    /**
    Use while you don't specify MODULE NAME for entity
     */
    public static var entityClassName: String {
        let className = NSStringFromClass(self)
        return className
    }
    
    /**
     Fuck Apple default initializer - use this one
     */
    convenience init(context: NSManagedObjectContext, _ belongsToModule: Bool = false) {
        
        let name = belongsToModule ? NSManagedObject.entityName : NSManagedObject.entityClassName
        let entity = NSEntityDescription.entity(forEntityName: name, in: context)!
        self.init(entity: entity, insertInto: context)
        self.entity.managedObjectClassName = name
    }
    
}
