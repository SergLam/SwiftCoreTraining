//
//  UINavigationController+NavBar.swift
//  SwiftCoreTraining
//
//  Created by Serhii Liamtsev on 4/23/21.
//  Copyright © 2021 Serg Liamtsev. All rights reserved.
//

import UIKit

extension UINavigationController {
 
    func transparentNavigationBar() {
        navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true
    }
    
}
