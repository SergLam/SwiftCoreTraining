//
//  Department.swift
//  SwiftCoreTraining
//
//  Created by Serhii Liamtsev on 4/23/21.
//  Copyright © 2021 Serg Liamtsev. All rights reserved.
//

import CoreData
import Foundation

public class Department: NSManagedObject {

    @NSManaged var companyID: Int64
    @NSManaged var employees: [Employee]
    @NSManaged var monthIncome: Decimal
    @NSManaged var title: String
}
