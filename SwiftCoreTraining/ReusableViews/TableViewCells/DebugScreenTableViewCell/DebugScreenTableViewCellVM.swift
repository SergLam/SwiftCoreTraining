//
//  DebugScreenTableViewCellVM.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 21.04.2021.
//  Copyright © 2021 Serg Liamtsev. All rights reserved.
//

import UIKit

struct DebugScreenTableViewCellVM: TableCellModel {
    
    var type: TableCellType {
        return .debugScreenCell
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
extension DebugScreenTableViewCellVM: Equatable {
    
    public static func == (lhs: DebugScreenTableViewCellVM, rhs: DebugScreenTableViewCellVM) -> Bool {
        
        return lhs.data == rhs.data
    }
    
}

// MARK: - Hashable
extension DebugScreenTableViewCellVM: Hashable {
    
    public func hash(into hasher: inout Hasher) {
        
        hasher.combine(data)
    }
    
}
