//
//  DebugVC.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 1/30/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import UIKit
import Eureka
import DZNEmptyDataSet

class DebugVC: FormViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "DebugVC"
        view.accessibilityLabel = "DebugVCView"
        self.tableView.emptyDataSetDelegate = self
        setupForm()
    }
    
    private func setupForm() {
        form
            +++ Section("GCD")
            <<< LabelRow() { row in
                row.title = "GCDVC"
                }.onCellSelection({ [unowned self] _, _ in
                    self.navigationController?.pushViewController(GCDVC(), animated: true)
                })
            +++ Section("UI")
            <<< LabelRow() { row in
                row.title = "SizeClasses (Orientation adaptive layout)"
                }.onCellSelection({ [unowned self] (_, _) in
                    self.navigationController?.pushViewController(SizeClassesVC(), animated: true)
                })
            +++ Section("Data structures and algorightms")
            <<< LabelRow() { row in
                row.title = "Array-Set convertions"
                }.onCellSelection({ [unowned self] (_, _) in
                    self.navigationController?.pushViewController(ArraySetVC(), animated: true)
                })
            +++ Section("Lets get deep into legacy!")
            <<< LabelRow() { row in
                row.title = "ObjC example view controller"
                }.onCellSelection({ [unowned self] (_, _) in
                    self.navigationController?.pushViewController(ExampleVC(), animated: true)
                })
            +++ Section("Algorithms")
            <<< LabelRow() { row in
                row.title = "Algorithms"
                }.onCellSelection({ [unowned self] (_, _) in
                    self.navigationController?.pushViewController(AlgorhitmsVC(), animated: true)
                })
            +++ Section("XML Parsing")
            <<< LabelRow() { row in
                row.title = "XMLParser VC"
                }.onCellSelection({ [unowned self] (_, _) in
                    self.navigationController?.pushViewController(XMLParserVC(), animated: true)
                })
    }
}

extension DebugVC: DZNEmptyDataSetDelegate {
    
}
