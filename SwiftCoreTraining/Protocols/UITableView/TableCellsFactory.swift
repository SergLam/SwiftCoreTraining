//
//  TableCellsFactory.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 31.04.2021.
//  Copyright © 2021 Serg Liamtsev. All rights reserved.
//

import UIKit

protocol TableViewCell: UITableViewCell {
    
}

protocol TableViewHeaderFooterView: UITableViewHeaderFooterView {
    
}

protocol TableCellsFactory {
    
    var cellTypes: [TableViewCell.Type] { get }
    
    var headerFooterTypes: [TableViewHeaderFooterView.Type] { get }
    
    func registerAllCells(for tableView: UITableView)
    
    func generateCell(for viewModel: TableCellModel, tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell
    
    func generateHeader(for viewModel: TableHeaderFooterModel, tableView: UITableView, at section: Int) -> UIView?
    
    func generateFooter(for viewModel: TableHeaderFooterModel, tableView: UITableView, at section: Int) -> UIView?
    
}
