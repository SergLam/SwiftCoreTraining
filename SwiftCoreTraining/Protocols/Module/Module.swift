//
//  Module.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 03.03.2020.
//  Copyright © 2020 serglam. All rights reserved.
//

import UIKit

protocol Module: class {
    func viewToPresent() -> View
}

// Module reference type wrapper: gives ability to store Module in Swift Collections
// and at the same time keep all internal cross-references of the module weak
// UIViewController.restorationId serves as ModuleReference.identifier
// Should think about this...
class ModuleReference: Hashable {
    var identifier: String
    var module: Module?
    
    init(identifier: String, module: Module? = nil) {
        self.identifier = identifier
        self.module = module
    }
    
    static func == (lhs: ModuleReference, rhs: ModuleReference) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    
}
