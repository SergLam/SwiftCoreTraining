//
//  Coordinator.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 03.03.2020.
//  Copyright © 2020 serglam. All rights reserved.
//

import UIKit
// https://www.hackingwithswift.com/articles/71/how-to-use-the-coordinator-pattern-in-ios-apps
// https://www.hackingwithswift.com/articles/175/advanced-coordinator-pattern-tutorial-ios
// https://medium.com/@pavlepesic/flow-coordination-pattern-5eb60cd220d5

protocol Coordinator: AnyObject {
    
    // NOTE: Required for Equitable conformance - delete coordinator from childCoordinators array
    var identifier: String{ get }
    
    var parentCoordinator: Coordinator? { get set }
    var childCoordinators: [Coordinator] { get set }
    func childDidFinish(_ child: Coordinator)
    
    var router: Router { get set }
}

extension Coordinator where Self: Equatable {
    
    static func == (lhs: Coordinator, rhs: Coordinator) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
}
