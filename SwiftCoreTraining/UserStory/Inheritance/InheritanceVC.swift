//
//  InheritanceVC.swift
//  SwiftCoreTraining
//
//  Created by Serhii Liamtsev on 7/13/21.
//  Copyright © 2021 Serg Liamtsev. All rights reserved.
//

import UIKit

final class InheritanceVC: BaseViewController {
    
    private let viewModel = InheritanceVCViewModel()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        viewModel.testInheritanceDefaultArguments1()
    }
    
}
