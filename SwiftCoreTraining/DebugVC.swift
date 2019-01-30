//
//  DebugVC.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 1/30/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import UIKit
import Eureka

class DebugVC: FormViewController {
 
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "DebugVC"
        view.accessibilityLabel = "DebugVCView"
        setupForm()
    }
    
    private func setupForm() {
        form
            +++ Section("Entrance")
            <<< LabelRow() { row in
                row.title = "EntranceVC"
                }.onCellSelection({ [unowned self] _, _ in
                    self.navigationController?.pushViewController(GCDVC(), animated: true)
                })
    }
}
