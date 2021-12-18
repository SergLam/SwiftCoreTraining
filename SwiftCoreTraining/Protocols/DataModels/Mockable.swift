//
//  Mockable.swift
//  SwiftCoreTraining
//
//  Created by Serhii Liamtsev on 12/18/21.
//  Copyright © 2021 Serg Liamtsev. All rights reserved.
//

import Foundation

protocol Mockable {
    
    associatedtype MockType
    
    static func mock(isSuccess: Bool) -> MockType
    
    static func mockArray(_ count: Int) -> [MockType]
}

extension Mockable {
    
    static func mockArray(_ count: Int) -> [MockType] {
        
        return Array(repeating: 0, count: count).map{ _ in
            return Self.mock(isSuccess: true)
        }
    }
}
