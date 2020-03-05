//
//  StatusBarResizable.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 6/1/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import UIKit

protocol StatusBarResizable {}

extension StatusBarResizable where Self: UIResponder {
    
    static func calculateStatusBarHeight() -> CGFloat {
        
        guard let topInset = UIApplication.shared.keyWindow?.safeAreaInsets.top else {
            preconditionFailure("Unable to get top inset")
        }
        guard topInset == 0 else {
            return topInset
        }
        return 20
    }
    
}
