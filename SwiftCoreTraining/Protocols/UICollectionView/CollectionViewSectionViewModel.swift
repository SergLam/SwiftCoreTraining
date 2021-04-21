//
//  CollectionViewSectionViewModel.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 31.04.2021.
//  Copyright © 2021 Serg Liamtsev. All rights reserved.
//

import Foundation

// NOTE: Helper struct that avoid two-dimensional array usage inside data source classes
struct CollectionViewSectionViewModel: CollectionSectionVM {
    
    var header: CollectionHeaderFooterModel?
    var footer: CollectionHeaderFooterModel?
    var cells: [CollectionCellModel] = []
    
    init(header: CollectionHeaderFooterModel? = nil,
         footer: CollectionHeaderFooterModel? = nil,
         cells: [CollectionCellModel]) {
        
        self.header = header
        self.footer = footer
        self.cells = cells
    }
    
}
