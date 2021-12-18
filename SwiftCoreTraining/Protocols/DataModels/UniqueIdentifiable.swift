//
//  UniqueIdentifiable.swift
//  SwiftCoreTraining
//
//  Created by Serhii Liamtsev on 12/18/21.
//  Copyright © 2021 Serg Liamtsev. All rights reserved.
//

import Foundation

protocol UniqueIdentifiable {
    
    var identifier: UUID { get set }
}
