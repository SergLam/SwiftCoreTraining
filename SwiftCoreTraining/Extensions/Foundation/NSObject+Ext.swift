//
//  NSObject+Ext.swift
//  SwiftCoreTraining
//
//  Created by Serhii Liamtsev on 4/21/21.
//  Copyright © 2021 serglam. All rights reserved.
//

import Foundation

extension NSObject {
    
    func executeOnMain(closure: @escaping VoidClosure) {
        if Thread.isMainThread {
            closure()
        } else {
            DispatchQueue.main.async {
                closure()
            }
        }
    }
    
    static func performOnMain(closure: @escaping VoidClosure) {
        if Thread.isMainThread {
            closure()
        } else {
            DispatchQueue.main.async {
                closure()
            }
        }
    }
    
    static func getClassName(_ obj: AnyClass) -> String{
        return String(NSStringFromClass(obj.self).split(separator: ".").last ?? "")
    }
    
}
