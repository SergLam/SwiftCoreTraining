//
//  SwiftCoreTrainingUITests.swift
//  SwiftCoreTrainingUITests
//
//  Created by Serg Liamthev on 1/26/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import XCTest

final class SwiftCoreTrainingUITests: XCTestCase {

    var app: XCUIApplication?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        app?.terminate()
    }

    func testExample() throws {
        
        app = XCUIApplication()
        app?.launch()
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }

}
