//
//  DebugVCView.swift
//  SwiftCoreTraining
//
//  Created by Serhii Liamtsev on 4/23/21.
//  Copyright © 2021 Serg Liamtsev. All rights reserved.
//

import UIKit

final class DebugVCView: UIView {
    
    let tableView: UITableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        addSubview(tableView)
        tableView.contentMode = .scaleAspectFit
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        let tableViewConstraints: [NSLayoutConstraint] = [
            
            tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
        ]
        NSLayoutConstraint.activate(tableViewConstraints)
        
    }
}
