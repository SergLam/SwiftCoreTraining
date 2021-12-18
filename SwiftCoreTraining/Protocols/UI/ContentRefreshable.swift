//
//  ContentRefreshable.swift
//  SwiftCoreTraining
//
//  Created by Serhii Liamtsev on 12/18/21.
//  Copyright © 2021 Serg Liamtsev. All rights reserved.
//

import Foundation

protocol ContentRefreshable: AnyObject {
    
    var identifier: UUID { get set }
    
    func refreshContent()
    
    func startSilentContentRefreshing()
    
    func stopSilentContentRefreshing()
}
