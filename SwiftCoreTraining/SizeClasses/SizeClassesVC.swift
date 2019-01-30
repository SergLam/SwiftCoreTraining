//
//  SizeClassesVC.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 1/30/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import UIKit

class SizeClassesVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        if traitCollection.horizontalSizeClass == .regular {
            if UIDevice.current.orientation == .landscapeLeft {
                // TODO: set layout for landscape left
            } else if UIDevice.current.orientation == .landscapeRight {
                // TODO: set layout for landscape rigt
            }
        } else {
            // TODO: set layout for portrait
        }
        super.traitCollectionDidChange(previousTraitCollection)
    }
}
