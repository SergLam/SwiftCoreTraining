//
//  Employee.swift
//  SwiftCoreTraining
//
//  Created by Serhii Liamtsev on 4/23/21.
//  Copyright © 2021 Serg Liamtsev. All rights reserved.
//

import CoreData
import Foundation

public class Employee: NSManagedObject {

    @NSManaged var id: Int64
    @NSManaged var firstName: String
    @NSManaged var lastName: String
    @NSManaged var position: String
    @NSManaged var salary: Decimal
    
}
