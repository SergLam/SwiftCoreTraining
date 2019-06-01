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

class DebugVC: FormViewController, DebugVCShowable {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "DebugVC"
        view.accessibilityLabel = "DebugVCView"
        self.tableView.emptyDataSetDelegate = self
        setupForm()
    }
    
    private func setupForm() {
        form
            +++ Section("WebSockets")
            <<< LabelRow() { row in
                row.title = "WebSockets - StarScream"
                }.onCellSelection({ [unowned self] (_, _) in
                    self.navigationController?.pushViewController(WebSocketStarscreamVC(), animated: true)
                })
            <<< LabelRow() { row in
                row.title = "WebSockets - Socket.IO"
                }.onCellSelection({ [unowned self] (_, _) in
                    self.navigationController?.pushViewController(WebSocketSocketIOVC(), animated: true)
                })
            +++ Section("KVO_KVC")
            <<< LabelRow() { row in
                row.title = "KVO_View_Controller"
                }.onCellSelection({ [unowned self] (_, _) in
                    self.navigationController?.pushViewController(KVO_VC(), animated: true)
                })
            <<< LabelRow() { row in
                row.title = "KVC_View_Controller"
                }.onCellSelection({ [unowned self] (_, _) in
                    self.navigationController?.pushViewController(KVC_VC(), animated: true)
                })
            +++ Section("Core Data")
            <<< LabelRow() { row in
                row.title = "Core Data VC"
                }.onCellSelection({ [unowned self] (_, _) in
                    self.navigationController?.pushViewController(CoreDataVC(), animated: true)
                })
            +++ Section("GCD")
            <<< LabelRow() { row in
                row.title = "GCDVC"
                }.onCellSelection({ [unowned self] _, _ in
                    self.navigationController?.pushViewController(GCDVC(), animated: true)
                })
            +++ Section("UI")
            <<< LabelRow() { row in
                row.title = "Accordion table view"
                }.onCellSelection({ [unowned self] (_, _) in
                    self.present(PrivacyPolicyVC(), animated: true, completion: nil)
                })
            <<< LabelRow() { row in
                row.title = "SizeClasses (Orientation adaptive layout)"
                }.onCellSelection({ [unowned self] (_, _) in
                    self.navigationController?.pushViewController(SizeClassesVC(), animated: true)
                })
            <<< LabelRow() { row in
                row.title = "CustomTransitions (Animations)"
                }.onCellSelection({ [unowned self] (_, _) in
                    self.navigationController?.pushViewController(CustomTransitionsVC(), animated: true)
                })
            <<< LabelRow() { row in
                row.title = "SystemTransitions"
                }.onCellSelection({ [unowned self] (_, _) in
                    self.navigationController?.pushViewController(SystemTransitionRootVC(), animated: true)
                })
            
            +++ Section("Swift Basics")
            <<< LabelRow() { row in
                row.title = "SubclassingVC"
                }.onCellSelection({ [unowned self] (_, _) in
                 self.navigationController?.pushViewController(SubclassingVC(), animated: true)
                })
            +++ Section("Data structures and algorightms")
            <<< LabelRow() { row in
                row.title = "Array-Set convertions"
                }.onCellSelection({ [unowned self] (_, _) in
                    self.navigationController?.pushViewController(ArraySetVC(), animated: true)
                })
            +++ Section("Objc features!")
            <<< LabelRow() { row in
                row.title = "ObjC example view controller"
                }.onCellSelection({ [unowned self] (_, _) in
                    self.navigationController?.pushViewController(ExampleVC(), animated: true)
                })
            <<< LabelRow() { row in
                row.title = "Objc_associatedKeyValues"
                }.onCellSelection({ [unowned self] (_, _) in
                    self.showDebugVC()
                })
            +++ Section("Algorithms")
            <<< LabelRow() { row in
                row.title = "Algorithms"
                }.onCellSelection({ [unowned self] (_, _) in
                    self.navigationController?.pushViewController(AlgorhitmsVC(), animated: true)
                })
            <<< LabelRow() { row in
                row.title = "RecursiveAlgorithms VC"
                }.onCellSelection({ [unowned self] (_,_) in
                    self.navigationController?.pushViewController(RecursiveAlgorithmsVC(), animated: true)
                })
            +++ Section("XML Parsing")
            <<< LabelRow() { row in
                row.title = "XMLParser VC"
                }.onCellSelection({ [unowned self] (_, _) in
                    self.navigationController?.pushViewController(XMLParserVC(), animated: true)
                })
            <<< LabelRow() { row in
                row.title = "CustomHTMLParser VC"
                }.onCellSelection({ [unowned self] (_, _) in
                    self.navigationController?.pushViewController(CustomHTMLParserVC(), animated: true)
                })
    }
}

extension DebugVC: DZNEmptyDataSetDelegate {
    
}
