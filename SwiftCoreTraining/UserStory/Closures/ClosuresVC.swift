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
    private lazy var viewModel: ClosuresVCViewModel = ClosuresVCViewModel()
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // viewModel.valuesCapturing()
        viewModel.valuesCapturingWithGCD()
    }
    
}

#if DEBUG
#if targetEnvironment(simulator)
import SwiftUI

@available(iOS 13.0, *)
struct ClosuresVC_Previews: PreviewProvider {
    
    static var devices = AppConstants.previewDevices
    
    static var platform: PreviewPlatform? {
        return SwiftUI.PreviewPlatform.iOS
    }
    
    static var previews: some SwiftUI.View {
        
        ForEach(devices, id: \.self) { deviceName in
            Group {
                
                UIViewControllerPreview {
                    let vc = ClosuresVC()
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
