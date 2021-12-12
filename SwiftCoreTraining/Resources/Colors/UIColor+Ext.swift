//
//  UIColor+Ext.swift
//  SwiftCoreTraining
//
//  Created by Serhii Liamtsev on 12/12/21.
//  Copyright © 2021 Serg Liamtsev. All rights reserved.
//

import UIKit

extension UIColor {
    
    @nonobjc class var shadow: UIColor {
        // #000000 = rgba(0, 0, 0, 0.13)
        return UIColor.black.withAlphaComponent(0.13)
    }
}
