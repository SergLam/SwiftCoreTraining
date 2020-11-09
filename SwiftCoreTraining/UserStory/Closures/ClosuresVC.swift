//
//  ClosuresVC.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 09.11.2020.
//  Copyright © 2020 serglam. All rights reserved.
//

import UIKit

final class ClosuresVC: BaseViewController {
    
    private lazy var contentView: ClosuresVCView = ClosuresVCView()
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        test()
    }
    
    private func test() {
        
        var number = "One"

        let closureCapture = { [number] in
            debugPrint("Closure Capture \(number)")
        }
        let closureNonCapture = {
            debugPrint("Closure Non Capture \(number)")
        }

        number = "Two"

        let newClosure = closureCapture
        newClosure()
        
        let newClosure1 = closureNonCapture
        newClosure1()
    }
    
}
