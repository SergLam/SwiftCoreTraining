//
//  CoreDataVC.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 4/21/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import UIKit
import CoreData

final class CoreDataVC: UIViewController {
    
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
            let company = Company.init(context: dbManager.context)
            company.companyID = Int64(dbManager.readAllObjects(Company.self).count)
            company.monthIncome = 1000
            company.numberOfEmployee = Int64(500)
            company.title = "Test company\(company.companyID)"
            dbManager.write(shouldUpdate: true, entities: [company]) { [unowned self] (result) -> (Void) in
                if result {
                    AlertPresenter.showSuccessMessage(at: self, message: "New company added successfully")
                } else {
                    AlertPresenter.showErrorAlert(at: self, error: "New company write error")
                }
            }
        case .fetchObjectsByParameter:
            guard let objects = dbManager.fetchObjects("numberOfEmployee", 500, Company.self) else {
                AlertPresenter.showSuccessMessage(at: self, message: "Empty fetsh request result")
                return
            }
            AlertPresenter.showSuccessMessage(at: self, message: String.init(describing: objects.count))
        case .readAllObjects:
            let objects = dbManager.readAllObjects(Company.self)
            AlertPresenter.showSuccessMessage(at: self, message: String.init(describing: objects.count))
        case .deleteObjectsByParameter:
            dbManager.deleteObjects("numberOfEmployee", 500, Company.self) { (result, description) in
                if result {
                    AlertPresenter.showSuccessMessage(at: self, message: description)
                } else {
                    AlertPresenter.showErrorAlert(at: self, error: description)
                }
            }
        case .deleteAll:
            dbManager.deleteAll(Company.self) { (result, description) -> (Void) in
                if result {
                    AlertPresenter.showSuccessMessage(at: self, message: description)
                } else {
                    AlertPresenter.showErrorAlert(at: self, error: description)
                }
            }
        }
    }
    
}
