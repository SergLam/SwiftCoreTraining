//
//  Company.swift
//  SwiftCoreTraining
//
//  Created by Serhii Liamtsev on 4/23/21.
//  Copyright © 2021 Serg Liamtsev. All rights reserved.
//

import CoreData
import Foundation

final class Company: NSManagedObject {
    
    @NSManaged var companyID: Int64
    @NSManaged var departments: [Department]
    @NSManaged var monthIncome: Decimal
    @NSManaged var numberOfEmployee: Int64
    @NSManaged var title: String
}
