//
//  ZoomPopAnimator.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 4/14/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import UIKit

final class ZoomPopAnimator: NSObject {
    
    var duration: TimeInterval
    var viewToZoomOut: UIView
    var viewToRestore: UIView
    var endViewSize: CGRect
    
    init(duration: TimeInterval, viewToZoomOut: UIView, endViewSize: CGRect, viewToRestore: UIView) {
        self.duration = duration
        self.viewToZoomOut = viewToZoomOut
        self.endViewSize = endViewSize
        self.viewToRestore = viewToRestore
    }
}

extension ZoomPopAnimator: UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        guard let toView = transitionContext.view(forKey: .to) else { return }
        
        // Hide view controller before presenting it
        containerView.addSubview(toView)
        toView.alpha = 0
        self.viewToRestore.transform = CGAffineTransform.identity
        
        UIView.animate(withDuration: duration, animations: { [unowned self] in
            // Show view controller, with fade in animation
            toView.alpha = 1
            
            let screenCenter = CGPoint(x: UIScreen.width / 2, y: UIScreen.height / 2)
            self.viewToZoomOut.frame = self.viewToRestore.frame
            self.viewToZoomOut.center = screenCenter
            
        }) { _ in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
    
}
