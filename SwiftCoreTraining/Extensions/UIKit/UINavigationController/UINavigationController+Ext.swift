//
//  UINavigationController+Ext.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 2/3/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import UIKit

extension UINavigationController {
    
    // MARK: Size classes + layout orientation
    override open var shouldAutorotate: Bool {
        if let visibleVC = visibleViewController {
            return visibleVC.shouldAutorotate
        }
        return super.shouldAutorotate
    }
    
    override open var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation{
        if let visibleVC = visibleViewController {
            return visibleVC.preferredInterfaceOrientationForPresentation
        }
        return super.preferredInterfaceOrientationForPresentation
    }
    
    override open var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        if let visibleVC = visibleViewController {
            return visibleVC.supportedInterfaceOrientations
        }
        return super.supportedInterfaceOrientations
    }
    
}
