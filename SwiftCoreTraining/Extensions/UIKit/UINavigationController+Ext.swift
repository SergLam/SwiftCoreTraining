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
        get {
            if let visibleVC = visibleViewController {
                return visibleVC.shouldAutorotate
            }
            return super.shouldAutorotate
        }
    }
    
    override open var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation{
        get {
            if let visibleVC = visibleViewController {
                return visibleVC.preferredInterfaceOrientationForPresentation
            }
            return super.preferredInterfaceOrientationForPresentation
        }
    }
    
    override open var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        get {
            if let visibleVC = visibleViewController {
                return visibleVC.supportedInterfaceOrientations
            }
            return super.supportedInterfaceOrientations
        }
    }
    
    
    func addBottomPushTransition() {
        let transition:CATransition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromBottom
        view.layer.add(transition, forKey: kCATransition)
//        navigationController?.view.layer.add(transition, forKey: kCATransition)
    }
    
    func addFlipTransition() {
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = CATransitionType(rawValue: "flip")
        transition.subtype = CATransitionSubtype.fromLeft
//        navigationController?.view.layer.add(transition, forKey: kCATransition)
        view.layer.add(transition, forKey: kCATransition)
    }
    
}
