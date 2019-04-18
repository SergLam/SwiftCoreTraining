//
//  SubclassingVC.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 3/24/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import UIKit

class A {
    var aa = 10
}

struct One {
    var value: Int = 10
    var reference: A = A()
}

class SubclassingVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkReferenceAtValueType()
    }
    
    private func checkReferenceAtValueType() {
        let valueType = One()
        let secondValueType = valueType
        valueType.reference.aa = 20
        debugPrint(secondValueType.reference.aa)
    }
    
    
}
