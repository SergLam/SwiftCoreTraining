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
  
    }
    
}
