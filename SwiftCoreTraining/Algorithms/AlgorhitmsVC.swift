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
        var array = [123,123123,4,3,6,34,43,67,34]
        bubleSort(&array)
        debugPrint(fibonacci(7))
    }
    
    
    func fibonacci(_ n: Int) -> Int {
        return fibonacci(n)
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
