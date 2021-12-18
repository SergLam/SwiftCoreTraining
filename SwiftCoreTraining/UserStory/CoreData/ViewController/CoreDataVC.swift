//
//  CoreDataVC.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 4/21/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import CoreData
import UIKit

final class CoreDataVC: BaseViewController {
    
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
    
    @objc
    private func performOperation(_ button: UIButton) {
        
        guard let manager = dbManager else {
            return
        }
        let index = button.tag
        let operation = CoreDataOpetations.allCases[index]
        switch operation {
        case .write:
            let company = Company(context: manager.context)
            company.companyID = Int64(manager.readAllObjects(Company.self).count)
            company.monthIncome = 1000
            company.numberOfEmployee = Int64(500)
            company.title = "Test company\(company.companyID)"
            manager.write(shouldUpdate: true, entities: [company]) { [unowned self] result -> Void in
                if result {
                    AlertPresenter.showSuccessMessage(at: self, message: "New company added successfully")
                } else {
                    AlertPresenter.showErrorAlert(at: self, error: "New company write error")
                }
            }
        case .fetchObjectsByParameter:
            guard let objects = manager.fetchObjects("numberOfEmployee", 500, Company.self) else {
                AlertPresenter.showSuccessMessage(at: self, message: "Empty fetsh request result")
                return
            }
            AlertPresenter.showSuccessMessage(at: self, message: String(describing: objects.count))
        case .readAllObjects:
            let objects = manager.readAllObjects(Company.self)
            AlertPresenter.showSuccessMessage(at: self, message: String(describing: objects.count))
        case .deleteObjectsByParameter:
            manager.deleteObjects("numberOfEmployee", 500, Company.self) { result, description in
                if result {
                    AlertPresenter.showSuccessMessage(at: self, message: description)
                } else {
                    AlertPresenter.showErrorAlert(at: self, error: description)
                }
            }
        case .deleteAll:
            manager.deleteAll(Company.self) { result, description in
                if result {
                    AlertPresenter.showSuccessMessage(at: self, message: description)
                } else {
                    AlertPresenter.showErrorAlert(at: self, error: description)
                }
            }
        }
    }
    
}

#if DEBUG
#if targetEnvironment(simulator)
import SwiftUI

@available(iOS 13.0, *)
struct CoreDataVC_Previews: PreviewProvider {
    
    static var devices = AppConstants.previewDevices
    
    static var platform: PreviewPlatform? {
        return SwiftUI.PreviewPlatform.iOS
    }
    
    static var previews: some SwiftUI.View {
        
        ForEach(devices, id: \.self) { deviceName in
            Group {
                
                UIViewControllerPreview {
                    let vc = CoreDataVC()
                    let navVC = UINavigationController(rootViewController: vc)
                    return navVC
                }
                
            }.previewDevice(PreviewDevice(rawValue: deviceName))
            .previewDisplayName(deviceName)
        }
        
    }
}
#endif
#endif
