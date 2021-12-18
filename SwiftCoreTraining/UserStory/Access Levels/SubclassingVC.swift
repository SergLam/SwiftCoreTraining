//
//  SubclassingVC.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 3/24/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import UIKit

final class AAAA {
    var aa = 10
}

struct TheOne {
    var value: Int = 10
    var reference: AAAA = AAAA()
}

final class SubclassingVC: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkReferenceAtValueType()
    }
    
    private func checkReferenceAtValueType() {
        let valueType = TheOne()
        let secondValueType = valueType
        valueType.reference.aa = 20
        debugPrint(secondValueType.reference.aa)
    }
    
}

class Hooray {
    private var property: String = ""
    var openProperty: String = ""
}

final class Groovy: Hooray {
    var some: String = ""
    
    func change() {
        some = super.openProperty
    }
}

#if DEBUG
#if targetEnvironment(simulator)
import SwiftUI

@available(iOS 13.0, *)
struct SubclassingVC_Previews: PreviewProvider {
    
    static var devices = AppConstants.previewDevices
    
    static var platform: PreviewPlatform? {
        return SwiftUI.PreviewPlatform.iOS
    }
    
    static var previews: some SwiftUI.View {
        
        ForEach(devices, id: \.self) { deviceName in
            Group {
                
                UIViewControllerPreview {
                    let vc = SubclassingVC()
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
