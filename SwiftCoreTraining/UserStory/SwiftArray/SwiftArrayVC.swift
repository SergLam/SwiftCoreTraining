//
//  SwiftArrayVC.swift
//  SwiftCoreTraining
//
//  Created by Serhii Liamtsev on 8/2/22.
//  Copyright © 2022 Serg Liamtsev. All rights reserved.
//

import UIKit

final class SwiftArrayVC: UIViewController {
    
    private let viewModel: SwiftArrayViewModel = SwiftArrayViewModel()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        configureNavBar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Swift Array - Test member adresses on copy:")
        viewModel.testArrayMembersAddresses()
        print("Swift Array - Test array adresses on copy:")
        viewModel.testArrayCopyOnWrite()
    }
    
    // MARK: - Private
    private func configureNavBar() {
        navigationItem.title = "Swift Array"
    }
}
