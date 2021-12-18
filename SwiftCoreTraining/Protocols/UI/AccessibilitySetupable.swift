//
//  AccessibilitySetupable.swift
//  SwiftCoreTraining
//
//  Created by Serhii Liamtsev on 12/18/21.
//  Copyright © 2021 Serg Liamtsev. All rights reserved.
//

import UIKit

protocol AccessibilitySetupable: AnyObject {
    
    associatedtype Entity
    
    func setupAccessibility(_ data: Entity)
    
    func removeAccessibility()
}

extension UIView {
    
    func setAccessibility(_ identifier: String?, _ label: String?, _ hint: String?) {
        
        isAccessibilityElement = true
        accessibilityIdentifier = identifier
        if label != nil {
            self.accessibilityLabel = label
        }
        if hint != nil {
            self.accessibilityHint = hint
        }
    }
    
    func removeAccessibility() {
        
        isAccessibilityElement = false
        accessibilityLabel = nil
        accessibilityHint = nil
        for view in subviews {
            view.isAccessibilityElement = false
            view.accessibilityLabel = nil
            view.accessibilityHint = nil
        }
    }
    
}
