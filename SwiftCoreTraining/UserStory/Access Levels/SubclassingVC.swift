//
//  SubclassingVC.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 3/24/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import UIKit

final class A {
    var aa = 10
}

struct One {
    var value: Int = 10
    var reference: A = A()
}

final class SubclassingVC: BaseViewController {
    
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

class H {
    private var property: String = ""
    var openProperty: String = ""
}

final class G: H {
    var some: String = ""
    
    func change() {
        some = super.openProperty
    }
}
