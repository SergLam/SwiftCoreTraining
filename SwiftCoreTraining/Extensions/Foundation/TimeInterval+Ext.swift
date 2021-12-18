//
//  TimeInterval+Ext.swift
//  SwiftCoreTraining
//
//  Created by Serhii Liamtsev on 12/18/21.
//  Copyright © 2021 Serg Liamtsev. All rights reserved.
//

import Foundation

extension TimeInterval {
    
    static var minute: TimeInterval {
        return 60.0
    }
    
    static var tenMinutes: TimeInterval {
        return 600.0
    }
    
    static var halfHour: TimeInterval {
        return 1800.0
    }
    
    static var hour: TimeInterval {
        return 3600.0
    }
    
    static var day: TimeInterval {
        return hour * 24
    }
    
    static var week: TimeInterval {
        return day * 7
    }
    
    static var month: TimeInterval {
        return day * 30
    }
    
    static var year: TimeInterval {
        return day * 365
    }
    
}
