//
//  AlgorhitmsVC.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 3/23/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import UIKit

class AlgorhitmsVC: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        var array = [123,123123,4,3,6,34,43,67,34]
//        bubleSort(&array)
        debugPrint(fib(6))
    }
    
    
    func fib(_ n: Int) -> Int {
        // 1 1 2 3 5 8 13
        debugPrint("Fibonacci function call with argumant: \(n)")
        if n <= 2 {
            return 1
        } else {
            return fib(n-2) + fib(n-1)
        }
        
    }
    
    private func bubleSort(_ array: inout [Int]) -> [Int] {
        for i in 0..<array.count {
            for j in 1..<array.count - i {
                if array[j] < array[j-1] {
                    let tmp = array[j-1]
                    array[j-1] = array[j]
                    array[j] = tmp
                }
            }
        }
        return array
    }
    
    
}
