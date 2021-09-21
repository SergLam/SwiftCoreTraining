//
//  CombineVC.swift
//  SwiftCoreTraining
//
//  Created by Serhii Liamtsev on 9/21/21.
//  Copyright © 2021 Serg Liamtsev. All rights reserved.
//

import UIKit

final class CombineVC: BaseViewController {
    
    private let viewModel = CombineVCViewModel()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        viewModel.challangeOne()
    }
    
}
