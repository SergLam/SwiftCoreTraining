//
//  DebugScreenTableHeaderFooterViewVM.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 21.04.2021.
//  Copyright © 2021 Serg Liamtsev. All rights reserved.
//

import UIKit

public struct DebugScreenTableHeaderFooterViewVM: TableHeaderFooterModel {
    
    var type: TableHeaderFooterType {
        return .debugScreenHeader
    }
    
    var rowHeight: CGFloat {
        return UITableView.automaticDimension
    }
    
    var data: String
    
    init(data: String) {
        
        self.data = data
    }
    
}

// MARK: - Equatable
extension DebugScreenTableHeaderFooterViewVM: Equatable {
    
    public static func == (lhs: DebugScreenTableHeaderFooterViewVM, rhs: DebugScreenTableHeaderFooterViewVM) -> Bool {
        
        return lhs.data == rhs.data
    }
    
}

// MARK: - Hashable
extension DebugScreenTableHeaderFooterViewVM: Hashable {
    
    public func hash(into hasher: inout Hasher) {
        
        hasher.combine(data)
    }
    
}
