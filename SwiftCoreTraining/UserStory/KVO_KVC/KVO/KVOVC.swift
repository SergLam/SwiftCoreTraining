//
//  KVOVC.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 4/20/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import UIKit

@objc
class Person: NSObject {
    @objc dynamic var name: String = "Test user"
}

final class KVOVC: BaseViewController {
    // Do  not to be confused with didSet willSet in Swift !!!!!
    // Use dynamic keyword for dynamic dispatch enabling (ObjC feature)
    // Good article - https://habr.com/ru/post/148922/
//    https://developer.apple.com/documentation/swift/cocoa_design_patterns/using_key-value_observing_in_swift
    let person = Person()
    var observation: NSKeyValueObservation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        observePersonName()
        AlertPresenter.showInputAlert(at: self, message: "Please enter person name") { [unowned self] text in
            self.person.name = text
        }
    }
    
    private func observePersonName() {
        observation = person.observe(\Person.name, options: [.old, .new]) { [unowned self] person, change in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
                guard let newValue = change.newValue, let oldValue = change.oldValue else { return }
                AlertPresenter.showSuccessMessage(at: self, message: "\(person.name) myDate changed from: \(oldValue), updated to: \(newValue)")
            })
            
        }
    }
    
}

#if DEBUG
#if targetEnvironment(simulator)
import SwiftUI

@available(iOS 13.0, *)
struct KVOVC_Previews: PreviewProvider {
    
    static var devices = AppConstants.previewDevices
    
    static var platform: PreviewPlatform? {
        return SwiftUI.PreviewPlatform.iOS
    }
    
    static var previews: some SwiftUI.View {
        
        ForEach(devices, id: \.self) { deviceName in
            Group {
                
                UIViewControllerPreview {
                    let vc = KVOVC()
                    let navVC = UINavigationController(rootViewController: vc)
                    return navVC
                }
                
            }.previewDevice(PreviewDevice(rawValue: deviceName))
            .previewDisplayName(deviceName)
        }
        
    }
}
#endif
#endif
