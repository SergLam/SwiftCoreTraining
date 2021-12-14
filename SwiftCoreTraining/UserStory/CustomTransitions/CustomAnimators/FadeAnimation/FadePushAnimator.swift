//
//  CustomMoveViewAnimator.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 4/14/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import UIKit

final class FadePushAnimator: NSObject {

    var duration: TimeInterval
    var viewsToHide: [UIView]
    
    init(duration: TimeInterval, viewsToHide: [UIView]) {
        self.duration = duration
        self.viewsToHide = viewsToHide
    }
}

extension FadePushAnimator: UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        guard let toView = transitionContext.view(forKey: .to) else { return }
        // Hide view controller before presenting it
        containerView.addSubview(toView)
        toView.alpha = 0
        viewsToHide.forEach{ $0.alpha = 0 }
        
        UIView.animate(withDuration: duration, animations: {
            // Show view controller, with fade in animation
            toView.alpha = 1
           
        }) { _ in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
    
}
