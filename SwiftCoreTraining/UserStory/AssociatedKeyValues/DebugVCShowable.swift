//
//  File.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 4/26/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import UIKit

private var storeKey = "SomeProtocol_propertyKey"

protocol DebugVCShowable {
    var property: DebugVC? { get set }
    func showDebugVC()
}

extension DebugVCShowable where Self: UIViewController {
    
    var property: DebugVC? {
        get {
            guard let property = objc_getAssociatedObject(DebugVC.self, &storeKey) as? DebugVC else {
                let vc = DebugVC()
                objc_setAssociatedObject(self, &storeKey, vc, .OBJC_ASSOCIATION_RETAIN)
                return vc
            }
            return property
        }
        set {
            print("shut up SwiftLint")
        }
    }
    
    func showDebugVC() {
        guard let vc = property else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
