//
//  CollectionHeaderFooterModels.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 31.01.2021.
//  Copyright © 2021 Serg Liamtsev. All rights reserved.
//

import Foundation

enum CollectionHeaderFooterType: Int {
    
    case myProfile = 0
}

protocol CollectionHeaderFooterModel {
    
    var type: CollectionHeaderFooterType { get }
}
