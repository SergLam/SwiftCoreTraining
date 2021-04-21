//
//  TableController.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 31.04.2021.
//  Copyright © 2021 Serg Liamtsev. All rights reserved.
//

import UIKit

protocol TableViewSectionVM {
    
    var header: TableHeaderFooterModel? { get set }
    var footer: TableHeaderFooterModel? { get set }
    var cells: [TableCellModel] { get set }
}

protocol TableController: NSObject, UITableViewDataSource & UITableViewDelegate {
    
    var updatesQueue: DispatchQueue { get set }
    
    var dataSource: [TableViewSectionVM] { get set }
    
    var factory: TableCellsFactory { get set }
    
    var tableView: UITableView { get set }
    
    init(tableView: UITableView)
    
    func updateDataSource(with newItems: [TableCellModel], animated: Bool)
    
}
