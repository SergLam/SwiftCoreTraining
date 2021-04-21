//
//  String+Localization.swift
//  SwiftCoreTraining
//
//  Created by Serhii Liamtsev on 4/21/21.
//  Copyright © 2021 serglam. All rights reserved.
//

import Foundation

extension String {
    
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
    
}
