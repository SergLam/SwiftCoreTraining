//
//  ArraySetVC.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 2/15/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import UIKit

final class ArraySetVC: BaseViewController {
    
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

#if DEBUG
#if targetEnvironment(simulator)
import SwiftUI

@available(iOS 13.0, *)
struct ArraySetVC_Previews: PreviewProvider {
    
    static var devices = AppConstants.previewDevices
    
    static var platform: PreviewPlatform? {
        return SwiftUI.PreviewPlatform.iOS
    }
    
    static var previews: some SwiftUI.View {
        
        ForEach(devices, id: \.self) { deviceName in
            Group {
                
                UIViewControllerPreview {
                    let vc = ArraySetVC()
                    let navVC = UINavigationController(rootViewController: vc)
                    return navVC
                }
                
            }.previewDevice(PreviewDevice(rawValue: deviceName))
            .previewDisplayName(deviceName)
        }
        
    }
}
#endif
#endif
