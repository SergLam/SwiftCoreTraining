//
//  CoreDataVC.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 4/21/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import UIKit

class CoreDataVC: UIViewController {
    
    let dbManager = CoreDataManager.shared
    let contentView = CoreDataView()
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtonsActions()
    }
    
    private func setupButtonsActions() {
        for (index, button) in contentView.buttons.enumerated() {
            button.tag = index
            button.addTarget(self, action: #selector(performOperation), for: .touchUpInside)
        }
    }
    
    @objc func performOperation(_ button: UIButton) {
        let index = button.tag
        let operation = CoreDataOpetations.allCases[index]
        switch operation {
        case .write:
            let company = Company.init(entity: Company.entity(), insertInto: dbManager.managedObjectContext)
            company.companyID = Int64(dbManager.readAllObjects(Company.self).count)
            company.monthIncome = 1000
            company.numberOfEmployee = Int64(500)
            company.title = "Test company\(company.companyID)"
            dbManager.write(shouldUpdate: true, entities: [company]) { [unowned self] (result) -> (Void) in
                if result {
                    AlertPresenter.showSuccessMessage(at: self, message: "New company added successfully")
                } else {
                    AlertPresenter.showError(at: self, error: "New company write error")
                }
            }
        case .readById:
            break
        case .readAllObjects:
            break
        case .delete:
            break
        case .deleteById:
            break
        case .deleteAll:
            break
        }
    }
    
}
