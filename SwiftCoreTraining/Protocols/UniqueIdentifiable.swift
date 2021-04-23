//
//  UniqueIdentifiable.swift
//  SwiftCoreTraining
//
//  Created by Serhii Liamtsev on 4/23/21.
//  Copyright © 2021 Serg Liamtsev. All rights reserved.
//

import Foundation

protocol UniqueIdentifiable {
    
    var identifier: UUID { get set }
}
