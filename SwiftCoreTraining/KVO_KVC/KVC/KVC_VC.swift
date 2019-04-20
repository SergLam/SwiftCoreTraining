//
//  KVC_VC.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 4/20/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import UIKit

@objc class Human: NSObject {
    @objc dynamic var name: String
    @objc dynamic var dog: Dog?
    
    init(name: String) {
        self.name = name
    }
}

@objc class Dog: NSObject {
    @objc dynamic var name: String = "Wolf"
    @objc dynamic var age: Int = 3
    @objc dynamic var owner: Human?
    @objc dynamic var skills: [String] = ["sit down", "stand up", "follow me", "play with ball", "guard owner"]
}

class KVC_VC: UIViewController {
//    https://developer.apple.com/documentation/swift/using_objective-c_runtime_features_in_swift
    
    @objc let human = Human(name: "John")
    @objc let dog = Dog()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        human.setValue(dog, forKey: #keyPath(Human.dog))
        debugPrint(String(describing: human.dog?.name))
        
        human.setValue("New dog name", forKeyPath: #keyPath(Human.dog.name))
        debugPrint(String(describing: human.dog?.name))
    }
}
