//
//  UIButton+Ext.swift
//  SwiftCoreTraining
//
//  Created by IdeaSoft on 4/19/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import UIKit

extension UIButton {
    
    static func createGrayButton() -> UIButton {
        let button = UIButton()
        button.backgroundColor = .gray
        button.titleLabel?.textColor = .white
        return button
    }
}
