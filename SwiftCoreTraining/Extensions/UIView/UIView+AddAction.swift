//
//  UIView+AddAction.swift
//  SwiftCoreTraining
//
//  Created by Serhii Liamtsev on 4/13/21.
//  Copyright © 2021 serglam. All rights reserved.
//

import UIKit

struct AssociatedKeys {
    
    static var actionState: UInt8 = 0
}

extension UIView {
    
    var addAction: VoidClosure? {
        get {
            guard let value = objc_getAssociatedObject(self, &AssociatedKeys.actionState) as? VoidClosure else {
                return nil
            }
            return value
        }
        set {
            isUserInteractionEnabled = true
            objc_setAssociatedObject(self, &AssociatedKeys.actionState, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            self.tapWithAnimation()
        }
    }
    
    func tapWithAnimation() {
        self.gestureRecognizers?.removeAll()
        let tap = UITapGestureRecognizer(target: self, action: #selector(viewTap(_:)))
        self.addGestureRecognizer(tap)
    }
    
    @objc
    func viewTap(_ gesture: UIGestureRecognizer) {
        addAction?()
    }
    
}
