//
//  DeinitAble.swift
//  SwiftCoreTraining
//
//  Created by Serhii Liamtsev on 12/18/21.
//  Copyright © 2021 Serg Liamtsev. All rights reserved.
//

import Foundation

/// Custom mechanism to remove potential memory leaks for objects.
/// Created as an alternative to default `deinit` method, which will be never called if we have some closures / timers / subscriptions / strong delegate or etc. things in object
protocol DeinitAble: AnyObject {
    
    // NOTE: - Unsubscribe, destroy and null every potential leak reason in this method
    func prepareToDeinit()
}
