//
//  String+Ext.swift
//  SwiftCoreTraining
//
//  Created by Serhii Liamtsev on 7/11/23.
//  Copyright © 2023 Serg Liamtsev. All rights reserved.
//

import Foundation

extension String {
    
    func trim() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
}
