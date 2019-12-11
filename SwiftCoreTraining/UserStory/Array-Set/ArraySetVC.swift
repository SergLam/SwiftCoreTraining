//
//  ArraySetVC.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 2/15/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import UIKit

final class ArraySetVC: UIViewController {
    
    var usersArray: [User] = []
    var usersSet = Set<User>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usersArray = createTestData()
//        convertArrayToSet()
//        convertSetToArray()
//        convertSetToArrayByAppending()
//        appendArrayToSet()
    }
    
    private func createTestData() -> [User] {
        var result: [User] = []
        for _ in 1..<100000 {
            result.append(User())
        }
        return result
    }
    
    private func filterArrayByArray() {
//        let usersID =
    }
    
    private func convertArrayToSet() {
        let startTime = CFAbsoluteTimeGetCurrent()
        usersSet = Set(usersArray)
        let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
        print("Time elapsed for convertArrayToSet: \(timeElapsed) s.")
    }
    
    private func convertSetToArray() {
        let startTime = CFAbsoluteTimeGetCurrent()
        usersArray.removeAll()
        usersArray = Array(usersSet)
        let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
        print("Time elapsed for convertSetToArray: \(timeElapsed) s.")
    }
    
    private func convertSetToArrayByAppending() {
        let startTime = CFAbsoluteTimeGetCurrent()
        usersArray.removeAll()
        usersArray.append(contentsOf: Array(usersSet))
        let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
        print("Time elapsed for convertSetToArrayByAppending: \(timeElapsed) s.")
    }
    
    private func appendArrayToSet() {
        let newData = createTestData()
        let startTime = CFAbsoluteTimeGetCurrent()
        usersSet.removeAll()
        usersSet.removeAll(keepingCapacity: true)
        usersSet.formUnion(newData)
        let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
        print("Time elapsed for appendArrayToSet: \(timeElapsed) s.")
    }
    
 
}
