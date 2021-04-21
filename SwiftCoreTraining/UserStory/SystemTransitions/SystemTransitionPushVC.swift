//
//  SystemTransitionPushVC.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 4/15/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import UIKit

final class SystemTransitionPushVC: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    private func setupLayout() {
        view.backgroundColor = .green
        navigationController?.addFlipTransition()
    }
    
}
