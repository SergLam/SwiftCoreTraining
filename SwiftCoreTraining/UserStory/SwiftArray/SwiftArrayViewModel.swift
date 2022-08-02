//
//  SwiftArrayViewModel.swift
//  SwiftCoreTraining
//
//  Created by Serhii Liamtsev on 8/2/22.
//  Copyright © 2022 Serg Liamtsev. All rights reserved.
//

import Foundation

final class SwiftArrayViewModel {
    
    // What are addresses for 'array1' and 'array2'?
    
    // Note: this is a more tricky question than it seems.
    // We need to decide what addresses we are speaking about.
    // Cause an array itself behaves like a regular struct and
    // copies on assignment, but its internal buffer reference
    // is kept the same for both “instances”. But swift performs
    // an aggressive bridging for collections so if you type this code:
    func testArrayMembersAddresses() {
        var array1 = [1, 2, 3, 4]
        var array2 = array1

        print("\(address(o: &array1))")
        print("\(address(o: &array2))")
        array1.withUnsafeBytes { pointer in
            print("\(Int(bitPattern: pointer.baseAddress))")
        }
    }
    
    func testArrayCopyOnWrite() {
        var array1: Any = [1, 2, 3, 4]
        var array2 = array1

        print("\(address(o: &array1))")
        print("\(address(o: &array2))")
    }
    
    private func address(o: UnsafeRawPointer) -> Int {
        return Int(bitPattern: o)
    }
}
