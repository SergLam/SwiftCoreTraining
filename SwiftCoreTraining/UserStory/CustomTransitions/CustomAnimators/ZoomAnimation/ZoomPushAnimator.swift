//
//  ZoomPushAnimator.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 4/14/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import UIKit

final class ZoomPushAnimator: NSObject {
    
    var duration: TimeInterval
    var viewToZoom: UIView
    var endFrame: CGRect
    
    init(duration: TimeInterval, viewToZoom: UIView, endSize: CGRect) {
        self.duration = duration
        self.viewToZoom = viewToZoom
        self.endFrame = endSize
    }
}

extension ZoomPushAnimator: UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        guard let toView = transitionContext.view(forKey: .to) else { return }
        // Hide view controller before presenting it
        
        toView.alpha = 0
        containerView.addSubview(toView)
        
        UIView.animate(withDuration: duration, animations: { [unowned self] in
            toView.alpha = 1
            let screenCenter = CGPoint(x: UIScreen.width / 2, y: UIScreen.height / 2)
            
            let endViewSize = CGSize(width: UIScreen.width / 2, height: UIScreen.width / 2)
            let initialViewSize = self.viewToZoom.bounds
            
            self.viewToZoom.transform = CGAffineTransform(scaleX: endViewSize.width / initialViewSize.width, y: endViewSize.height / initialViewSize.height)
            
            self.viewToZoom.center = screenCenter
        }) { _ in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
    
}
