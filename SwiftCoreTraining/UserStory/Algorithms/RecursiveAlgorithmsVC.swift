//
//  RecursiveAlgorithmsVC.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 3/24/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import UIKit

final class RecursiveAlgorithmsVC: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        printAllNumbers(100)
//        printAllNumbersBetween(20, 10)
//        debugPrint(akkermanFunction(3, 7))
//        isPowerOfTwo(9)
//        debugPrint("\(sumOfDigits(198))")
//        numberFromRigthToLeft(102)
//        debugPrint(numberFromLeftToRight(102))
        debugPrint(factorial(4))
        debugPrint(factorial(3))
        debugPrint(factorial(0))
    }
    
    private func factorial(_ num: Int) -> Int {
        if num == 0 {
            return 1
        } else {
            return num * factorial(num - 1)
        }
    }
    
    private func printAllNumbers(_ number: Int) {
        // Дано натуральное число n. Выведите все числа от 1 до n.
        if number == 1 {
            debugPrint("\(number)")
        } else {
            printAllNumbers(number - 1)
            debugPrint("\(number)")
        }
    }
    
    private func printAllNumbersBetween(_ a: Int, _ b: Int) {
        // Даны два целых числа A и В (каждое в отдельной строке).
        // Выведите все числа от A до B включительно, в порядке возрастания, если A < B, или в порядке убывания в противном случае.
        if a < b - 1{
            debugPrint(a + 1)
            printAllNumbersBetween(a + 1, b)
        }
        if a - 1 > b {
            debugPrint(a - 1)
            printAllNumbersBetween(a - 1, b)
        }
    }
    
    private func akkermanFunction(_ n: Int, _ m: Int) -> Int {
        if n == 0 {
            return m + 1
        } else if m == 0 {
            return akkermanFunction(n - 1, 1)
        } else {
            return akkermanFunction(n - 1, akkermanFunction(n, m - 1))
        }
    }
    
    private func isPowerOfTwo(_ number: Int) {
        if number <= 2 {
            let result: String = number % 2 == 0 ? "YES" : "NO"
            debugPrint(result)
        } else {
            isPowerOfTwo(number - 2)
        }
    }
    
    private func sumOfDigits(_ number: Int) -> Int {
        // Дано натуральное число N. Вычислите сумму его цифр.
        // При решении этой задачи нельзя использовать строки, списки, массивы (ну и циклы, разумеется).
        if number <= 10 {
            if number == 10{
                return 1
            } else {
                return number
            }
        } else {
            return sumOfDigits(Int(number / 10)) + number % 10
        }
    }
    
    private func numberFromRigthToLeft(_ number: Int) {
//        Дано натуральное число N. Выведите все его цифры по одной, в обратном порядке, разделяя их пробелами или новыми строками.
//        При решении этой задачи нельзя использовать строки, списки, массивы (ну и циклы, разумеется). Разрешена только рекурсия и целочисленная арифметика.
        if number <= 10 {
            if number == 10{
                debugPrint(0)
                debugPrint(1)
            } else {
                debugPrint(number)
            }
        } else {
            numberFromRigthToLeft(Int(number / 10))
            debugPrint(number % 10)
        }
    }
    
    private func numberFromLeftToRight(_ number: Int) -> String {
//        Дано натуральное число N. Выведите все его цифры по одной, в обычном порядке, разделяя их пробелами или новыми строками.
//        При решении этой задачи нельзя использовать строки, списки, массивы (ну и циклы, разумеется). Разрешена только рекурсия и целочисленная арифметика.
        if number < 10 {
            return String(number)
        } else {
            return numberFromLeftToRight(Int(number / 10)) + " " + String(number % 10)
        }
    }
    
}

#if DEBUG
#if targetEnvironment(simulator)
import SwiftUI

@available(iOS 13.0, *)
struct RecursiveAlgorithmsVC_Previews: PreviewProvider {
    
    static var devices = AppConstants.previewDevices
    
    static var platform: PreviewPlatform? {
        return SwiftUI.PreviewPlatform.iOS
    }
    
    static var previews: some SwiftUI.View {
        
        ForEach(devices, id: \.self) { deviceName in
            Group {
                
                UIViewControllerPreview {
                    let vc = RecursiveAlgorithmsVC()
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
