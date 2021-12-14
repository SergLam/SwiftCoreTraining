//
//  SwipeBackPanDirectionGestureRecognizer.swift
//  SwiftCoreTraining
//
//  Created by Sergey Lamcev on 13/02/2020.
//  Copyright © 2020 SergLam. All rights reserved.
//

import UIKit

enum HorizontalDirection {
    case LeftToRight
    case RightToLeft
}

enum VerticalDirection {
    case TopToBottom
    case BottomToTop
}

enum PanDirection {
    case vertical(direction: VerticalDirection)
    case horizontal(direction: HorizontalDirection)
}

final class PanDirectionGestureRecognizer: UIPanGestureRecognizer {
    
    let direction: PanDirection
    
    init(direction: PanDirection, target: AnyObject, action: Selector) {
        self.direction = direction
        super.init(target: target, action: action)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesMoved(touches, with: event)
        
        guard state == .began else {
            return
        }
        let vel = velocity(in: view)
        switch direction {
            
        case .horizontal(let direction):
            guard abs(vel.y) > abs(vel.x) else {
                
                switch direction {
                case .LeftToRight:
                    guard vel.x > 0 else {
                        state = .cancelled
                        return
                    }
                    
                case .RightToLeft:
                    guard vel.x < 0 else {
                        state = .cancelled
                        return
                    }
                    
                }
                return
            }
            state = .cancelled
            
        case .vertical(let direction):
            guard abs(vel.x) > abs(vel.y) else {
                
                switch direction {
                case .TopToBottom:
                    guard vel.y < 0 else {
                        state = .cancelled
                        return
                    }
                    
                case .BottomToTop:
                    guard vel.y > 0 else {
                        state = .cancelled
                        return
                    }
                }
                return
            }
            state = .cancelled
        }
    }
    
}
