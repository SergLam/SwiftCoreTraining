//
//  TransitionPushVC.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 4/14/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import UIKit

final class TransitionPushVC: BaseViewController {
    
    let contentView = TransitionPushView()
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
