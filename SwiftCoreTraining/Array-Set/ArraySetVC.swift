//
//  ArraySetVC.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 2/15/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import UIKit

class ArraySetVC: UIViewController {
    
    var usersArray: [User] = []
    var usersSet = Set<User>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createTestData()
        convertArrayToSet()
    }
    
    private func createTestData() {
        for _ in 1..<100000 {
            usersArray.append(User())
        }
    }
    
    private func convertArrayToSet() {
        let startTime = CFAbsoluteTimeGetCurrent()
         usersSet = Set(usersArray)
        let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
        print("Time elapsed for convertArrayToSet: \(timeElapsed) s.")
    }
}
