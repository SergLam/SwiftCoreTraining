//
//  SizeClassesVC.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 1/30/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import UIKit

final class SizeClassesVC: UIViewController {
    
    let contentView = SizeClassesView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
    }
    
    override func loadView() {
        view = contentView
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        if traitCollection.horizontalSizeClass == .regular {
            if UIDevice.current.orientation == .landscapeLeft {
                // TODO: set layout for landscape left
                isNavBarHidden(true)
            } else if UIDevice.current.orientation == .landscapeRight {
                // TODO: set layout for landscape rigt
                isNavBarHidden(true)
            }
        } else {
            // TODO: set layout for portrait
            isNavBarHidden(false)
        }
        super.traitCollectionDidChange(previousTraitCollection)
    }
    
    private func isNavBarHidden(_ isHidden: Bool) {
        navigationController?.navigationBar.isHidden = isHidden
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
         return [.landscape, .portrait]
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
}
