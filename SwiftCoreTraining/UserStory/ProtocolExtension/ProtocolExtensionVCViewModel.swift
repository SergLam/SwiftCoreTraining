//
//  ProtocolExtensionVCViewModel.swift
//  SwiftCoreTraining
//
//  Created by Serhii Liamtsev on 8/1/22.
//  Copyright © 2022 Serg Liamtsev. All rights reserved.
//

import Foundation

protocol SampleProtocol {
  func foo()
}

extension SampleProtocol {
  func foo() {
    print("foo protocol")
  }
  func bar() {
    print("bar protocol")
  }
}

/// Protocol extensions + default methods implementations demo
final class ProtocolExtensionVCViewModel: SampleProtocol {
    
    func foo() {
        print("foo class")
    }
    
    func bar() {
        print("bar class")
    }
}
