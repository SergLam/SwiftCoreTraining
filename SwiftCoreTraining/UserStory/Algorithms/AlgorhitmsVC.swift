//
//  AlgorhitmsVC.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 3/23/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import UIKit

final class AlgorhitmsVC: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        var array = [123,123123,4,3,6,34,43,67,34]
        //        bubleSort(&array)
        //        debugPrint(fib(6))
        
        // Hanoi tower
        print("3 disks")
        tower(numberOfDisks: 3, source: .Tower1, dest: .Tower3, temp: .Tower2)
        
        print("--------")
        
        print("4 disks")
        tower(numberOfDisks: 4, source: .Tower1, dest: .Tower3, temp: .Tower2)
    }
    
    func fib(_ n: Int) -> Int {
        // 1 1 2 3 5 8 13
        debugPrint("Fibonacci function call with argumant: \(n)")
        if n <= 2 {
            return 1
        } else {
            return fib(n - 2) + fib(n - 1)
        }
        
    }
    
    private func bubleSort(_ array: inout [Int]) -> [Int] {
        for i in 0..<array.count {
            for j in 1..<array.count - i where array[j] < array[j - 1]  {
                let tmp = array[j - 1]
                array[j - 1] = array[j]
                array[j] = tmp
            }
        }
        return array
    }
    
    enum Tower: String {
        case Tower1 = "Tower 1"
        case Tower2 = "Tower 2"
        case Tower3 = "Tower 3"
    }
    
    func tower(numberOfDisks: Int, source x: Tower, dest y: Tower, temp z: Tower) {
        if numberOfDisks > 0 {
            let previousDisk = numberOfDisks - 1
            debugPrint("Current number \(numberOfDisks), previous number: \(previousDisk)")
            tower(numberOfDisks: previousDisk, source: x, dest: z, temp: y)
            debugPrint("Move disk \(numberOfDisks) from \(x.rawValue) to \(y.rawValue)")
            tower(numberOfDisks: previousDisk, source: z, dest: y, temp: x)
        }
    }
    
}

#if DEBUG
#if targetEnvironment(simulator)
import SwiftUI

@available(iOS 13.0, *)
struct AlgorhitmsVC_Previews: PreviewProvider {
    
    static var devices = AppConstants.previewDevices
    
    static var platform: PreviewPlatform? {
        return SwiftUI.PreviewPlatform.iOS
    }
    
    static var previews: some SwiftUI.View {
        
        ForEach(devices, id: \.self) { deviceName in
            Group {
                
                UIViewControllerPreview {
                    let vc = AlgorhitmsVC()
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
