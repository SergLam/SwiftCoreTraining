//
//  ClosuresVCViewModel.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 07.02.2021.
//  Copyright © 2021 serglam. All rights reserved.
//

import Foundation

final class ClosuresVCViewModel {
    
    func valuesCapturing() {
        
        var number = "One"
        
        let closureCapture = { [number] in
            debugPrint("Closure Capture \(number)")
        }
        let closureNonCapture = {
            debugPrint("Closure Non Capture \(number)")
        }
        
        number = "Two"
        
        let newClosure = closureCapture
        newClosure()
        
        let newClosure1 = closureNonCapture
        newClosure1()
    }
    
    /// 1. Что выведется в консоль?
    ///
    /// Initial object is MyObject(name: "First")
    /// object changed to MyObject(name: "Second")
    /// 1 — MyObject(name: "First")
    /// 2 — MyObject(name: "Second")
    /// 3 - MyObject(name: "Third")
    /// 4 — MyObject(name: "Second")
    /// 5 — MyObject(name: "Third")
    /// 6 - MyObject(name: "Fourth")
    ///
    ///
    /// 2. Что произойдет если MyObject будет классом?
    ///
    /// При копировании объекта будет создана ссылка, любые изменения будут менять рутовый объект
    ///
    /// MyObject - структура, у которой переопределен description
    ///
    /// Переопределение description не влияет на результат вывода в консоль
    ///
    /// Загвозка в структуре, как Value Type
    func valuesCapturingWithGCD() {
        
        var object = MyObject(name: "First")
        print("Initial object is \(object)")
        let capturedObject = object
        delay(1) {
            print("1 — \(capturedObject)")
            print("2 — \(object)")
            object = MyObject(name: "Third")
            print("3 - \(object)")
        }
        object.name = "Second"
        print("object changed to \(object)")
        delay(2) { [ capturedObject = object] in
            print("4 — \(capturedObject)")
            print("5 — \(object)")
            object = MyObject(name: "Fourth")
            print("6 - \(object)")
        }
    }
    
    func delay(_ seconds: Int, closure: @escaping () -> Void) {
        
        let time = DispatchTime.now() + .seconds(seconds)
        DispatchQueue.main.asyncAfter(deadline: time) {
            closure()
        }
    }
    
}
