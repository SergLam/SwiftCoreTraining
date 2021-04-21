//
//  TableHeaderFooterModels.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamtsev on 10/26/20.
//  Copyright © 2020 Serg Liamtsev. All rights reserved.
//

import UIKit

enum TableHeaderFooterType: Int {
    
    case debugScreenHeader
    
}

protocol TableHeaderFooterModel {
    
    var type: TableHeaderFooterType { get }
    
    var rowHeight: CGFloat { get } // UITableView.automaticDimension if your cell should have content-dependent height
}
