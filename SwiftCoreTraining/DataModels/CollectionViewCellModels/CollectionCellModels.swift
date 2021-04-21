//
//  CellModels.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 10/26/20.
//  Copyright © 2020 Serg Liamtsev. All rights reserved.
//

import Foundation

enum CollectionCellType: String {
    
    case titleAndText
    
}

protocol CollectionCellModel {
    var type: CollectionCellType { get }
}
