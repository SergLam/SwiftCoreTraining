//
//  UINavigationController+Navigation.swift
//  SwiftCoreTraining
//
//  Created by Serhii Liamtsev on 12/12/21.
//  Copyright © 2021 Serg Liamtsev. All rights reserved.
//

import UIKit

extension UINavigationController {
    
    func popToViewController(ofClass: AnyClass, animated: Bool = true) {
      if let vc = viewControllers.last(where: { $0.isKind(of: ofClass) }) {
        popToViewController(vc, animated: animated)
      }
    }
}
