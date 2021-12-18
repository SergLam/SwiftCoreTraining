//
//  LocaleRefreshable.swift
//  SwiftCoreTraining
//
//  Created by Serhii Liamtsev on 12/18/21.
//  Copyright © 2021 Serg Liamtsev. All rights reserved.
//

import UIKit

@objc
protocol LocaleRefreshable {
    
    // NOTE: - Required to change locale in runtime
    func subscribeToLocaleChangeNotification()
    @objc
    func refreshLocale()
}
