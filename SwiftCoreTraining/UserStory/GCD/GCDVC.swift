//
//  ViewController.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 1/26/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import UIKit

final class GCDVC: BaseViewController {
    
    private let viewModel = GCDViewModel()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // viewModel.loadImagesConcurently()
        // viewModel.task2()
        viewModel.task3()
    }
    
}
