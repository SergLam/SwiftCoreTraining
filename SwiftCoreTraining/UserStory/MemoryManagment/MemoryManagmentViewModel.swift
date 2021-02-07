//
//  MemoryManagmentViewModel.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 07.02.2021.
//  Copyright © 2021 serglam. All rights reserved.
//

import Foundation

final class MemoryManagmentViewModel {
    
    var c: TestMemoryClass? = TestMemoryClass()
    
    func task1() {
        
        var c: TestMemoryClass? = TestMemoryClass()
        weak var wC: TestMemoryClass? = c
        c = nil
        print(c?.str ?? "nil")
        print(wC?.str ?? "nil")
    }
    
}
