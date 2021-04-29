//
//  DebugScreenTableCellsFactory.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 21.04.2021.
//  Copyright © 2021 Serg Liamtsev. All rights reserved.
//

import UIKit

protocol DebugScreenTableCellsFactoryDelegate: AnyObject {
    
}

final class DebugScreenTableCellsFactory: TableCellsFactory {
    
    weak var delegate: DebugScreenTableCellsFactoryDelegate?
    
    var cellTypes: [TableViewCell.Type] {
        [
            DebugScreenTableViewCell.self
        ]
    }
    
    var headerFooterTypes: [TableViewHeaderFooterView.Type] {
        [
            DebugScreenTableHeaderFooterView.self
        ]
    }
    
    func registerAllCells(for tableView: UITableView) {
        
        cellTypes.forEach{
            
            tableView.register($0, forCellReuseIdentifier: $0.reuseIdentifier)
        }
        headerFooterTypes.forEach{
            
            tableView.register($0, forHeaderFooterViewReuseIdentifier: $0.reuseIdentifier)
        }
    }
    
    func generateCell(for viewModel: TableCellModel, tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        
        switch viewModel.type {
        case .debugScreenCell:
            
            guard let model = viewModel as? DebugScreenTableViewCellVM else {
                assertionFailure("Invalid model type")
                return UITableViewCell()
            }
            let cell = tableView.dequeueReusableCell(DebugScreenTableViewCell.self, for: indexPath)
            cell.configureWithModel(model)
            return cell
            
        default:
            
            assertionFailure("Invalid cell type")
            return UITableViewCell()
        }
    }
    
    func generateHeader(for viewModel: TableHeaderFooterModel, tableView: UITableView, at section: Int) -> UIView? {
        
        switch viewModel.type {
        case .debugScreenHeader:
            
            let header = tableView.dequeueReusable(headerFooterView: DebugScreenTableHeaderFooterView.self)
            guard let model = viewModel as? DebugScreenTableHeaderFooterViewVM else {
                return nil
            }
            header.update(with: model)
            return header
            
        default:
            return nil
        }
    }
    
    func generateFooter(for viewModel: TableHeaderFooterModel, tableView: UITableView, at section: Int) -> UIView? {
        
        return nil
    }
    
}
