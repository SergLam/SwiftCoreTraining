//
//  GCDDispatchBarier.swift
//  SwiftCoreTraining
//
//  Created by Andrii Mazepa on 03.12.2019.
//  Copyright © 2019 serglam. All rights reserved.
//

import Foundation

// https://habr.com/ru/post/320152/
public final class GCDDispatchBarier {
    
    private static let queueName = Bundle.main.bundleIdentifier ?? "SwiftCoreTraining"
    
    private let executionQueue: DispatchQueue
    
    private var someResource: String = ""
    
    init() {
        executionQueue = DispatchQueue(label: GCDDispatchBarier.queueName, qos: .userInteractive, attributes: .concurrent)
    }
    
    public func addString(_ value: String) {
        executionQueue.async(flags: .barrier) { [weak self] in
            self?.someResource.append(contentsOf: value)
        }
    }
    
    public func setString(_ value: String) {
        executionQueue.async(flags: .barrier) { [weak self] in
            self?.someResource = value
        }
    }
    
    public var stringValue: String {
        var result = ""
        executionQueue.sync{
            result = self.someResource
        }
        return result
    }
    
}
