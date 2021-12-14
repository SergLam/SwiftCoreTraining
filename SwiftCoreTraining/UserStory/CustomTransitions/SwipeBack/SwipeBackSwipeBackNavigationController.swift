//
//  SwipeBackSwipeBackNavigationController.swift
//  SwiftCoreTraining
//
//  Created by Sergey Lamcev on 13/02/2020.
//  Copyright © 2020 SergLam. All rights reserved.
//

import UIKit

// Fade animation: https://medium.com/@ludvigeriksson/custom-interactive-uinavigationcontroller-transition-animations-in-swift-4-a4b5e0cefb1e
// Slide animation: https://medium.com/swift2go/simple-custom-uinavigationcontroller-transitions-fdb56a217dd8
final class SwipeBackNavigationController: UINavigationController {

    private var interactionController: UIPercentDrivenInteractiveTransition?
    
    private var edgeSwipeGestureRecognizer: UIScreenEdgePanGestureRecognizer?
    private var panGesturerecognizer: PanDirectionGestureRecognizer?

    var shouldDismissRootScreen: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSwipeGesture()
        delegate = self
    }
        
    // MARK: - Private functions
    private func addSwipeGesture() {
        
        let edgeGesture = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        edgeSwipeGestureRecognizer = edgeGesture
        edgeSwipeGestureRecognizer?.edges = .left
        view.addGestureRecognizer(edgeGesture)
        
        let panDirection = PanDirection.horizontal(direction: .LeftToRight)
        let panGesture = PanDirectionGestureRecognizer(direction: panDirection, target: self, action: #selector(handleSwipe(_:)))
        panGesturerecognizer = panGesture
        view.addGestureRecognizer(panGesture)
    }

    @objc
    func handleSwipe(_ gesture: UIPanGestureRecognizer) {
        
        guard let gestureView = gesture.view else {
            interactionController = nil
            return
        }
        let percent = gesture.translation(in: gestureView).x / gestureView.bounds.size.width

        if gesture.state == .began {
            interactionController = UIPercentDrivenInteractiveTransition()
            let shouldDismiss = shouldDismissRootScreen && viewControllers.count == 1
            if shouldDismiss {
                dismiss(animated: true, completion: nil)
            } else {
                popViewController(animated: true)
            }
            
        } else if gesture.state == .changed {
            interactionController?.update(percent)
        } else if gesture.state == .ended {
            if percent > 0.5 && gesture.state != .cancelled {
                interactionController?.finish()
            } else {
                interactionController?.cancel()
            }
            interactionController = nil
        }
    }
    
}

// MARK: - UINavigationControllerDelegate
extension SwipeBackNavigationController: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        switch operation {
        case .push:
            return PopNavigationGestureAnimator(presenting: true)
        case .pop:
            return PopNavigationGestureAnimator(presenting: false)
        case .none:
            return nil
            
        @unknown default:
            return nil
        }
    }
    
    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactionController
    }
    
}
