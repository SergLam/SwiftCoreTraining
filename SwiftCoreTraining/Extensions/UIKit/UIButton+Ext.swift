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
    
    static func creareCloseButton(_ buttonHeight: CGFloat) -> UIButton {
        
        let button = UIButton()
        button.layer.cornerRadius = buttonHeight / 2
        button.clipsToBounds = true
        button.setTitle("Close", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        return button
    }
    
}
