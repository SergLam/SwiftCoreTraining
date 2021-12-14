//
//  UINavigationController+Transition.swift
//  SwiftCoreTraining
//
//  Created by Serhii Liamtsev on 4/23/21.
//  Copyright © 2021 Serg Liamtsev. All rights reserved.
//

import UIKit

extension UINavigationController {
 
    func addBottomPushTransition() {
        let transition: CATransition = CATransition()
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
