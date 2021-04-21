//
//  DebugScreenTableCellsFactory.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 21.04.2021.
//  Copyright © 2021 Serg Liamtsev. All rights reserved.
//

import UIKit

protocol DebugScreenTableCellsFactoryDelegate: class {
    
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
            let bundle = Bundle(for: $0)
            let nib = UINib(nibName: $0.reuseIdentifier, bundle: bundle)
            tableView.register(nib, forCellReuseIdentifier: $0.reuseIdentifier)
        }
        headerFooterTypes.forEach{
            let bundle = Bundle(for: $0)
            let nib = UINib(nibName: $0.reuseIdentifier, bundle: bundle)
            tableView.register(nib, forHeaderFooterViewReuseIdentifier: $0.reuseIdentifier)
        }
    }
    
    func generateCell(for viewModel: TableCellModel, tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        
        switch viewModel.type {
        default:
            
            // NOTE: - dequeueReusableCell example = cell update
//            guard let model = viewModel as? MyProfileHeaderTableViewCellVM else {
//                assertionFailure("Invalid model type")
//                return UITableViewCell()
//            }
//            let cell = view.dequeueReusableCell(MyProfileHeaderTableViewCell.self, for: indexPath)
//            cell.configureWithModel(model)
//            return cell
            
            assertionFailure("Invalid cell type")
            return UITableViewCell()
        }
    }
    
    func generateHeader(for viewModel: TableHeaderFooterModel, tableView: UITableView, at section: Int) -> UIView? {
        
        switch section {
        case 0:
            
//            let header = tableView.dequeueReusable(headerFooterView: MyPublicationsListHeaderView.self)
//            guard let model = viewModel as? MyPublicationsListHeaderViewVM else {
//                return nil
//            }
//            header.update(with: model)
//            return header
            
            return nil
            
        default:
            return nil
        }
    }
    
    func generateFooter(for viewModel: TableHeaderFooterModel, tableView: UITableView, at section: Int) -> UIView? {
        
        return nil
    }
    
}
