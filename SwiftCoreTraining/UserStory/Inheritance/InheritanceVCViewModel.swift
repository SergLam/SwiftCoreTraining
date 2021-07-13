//
//  InheritanceVCViewModel.swift
//  SwiftCoreTraining
//
//  Created by Serhii Liamtsev on 7/13/21.
//  Copyright © 2021 Serg Liamtsev. All rights reserved.
//

import Foundation

final class InheritanceVCViewModel {
    
    func testInheritanceDefaultArguments() {
        let s: InheritanceBase = InheritanceSub()
        s.test()
    }
    
    func testInheritanceDefaultArguments1() {
        let s: InheritanceSub = InheritanceSub()
        s.test()
    }
}

// MARK: - Default argumets with inheritance + override
class InheritanceBase {
    func test(i: Int = 1) {
        print("Base i: \(i)")
    }
}

class InheritanceSub: InheritanceBase {
    override func test(i: Int = 2) {
        print("Sub i: \(i)")
        super.test(i: i)
    }
}
