//
//  MemoryManagmentVC.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 07.02.2021.
//  Copyright © 2021 serglam. All rights reserved.
//

import UIKit

final class MemoryManagmentVC: BaseViewController {
    
    private let viewModel = MemoryManagmentViewModel()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        viewModel.task1()
    }
    
}

#if DEBUG
#if targetEnvironment(simulator)
import SwiftUI

@available(iOS 13.0, *)
struct MemoryManagmentVC_Previews: PreviewProvider {
    
    static var devices = AppConstants.previewDevices
    
    static var platform: PreviewPlatform? {
        return SwiftUI.PreviewPlatform.iOS
    }
    
    static var previews: some SwiftUI.View {
        
        ForEach(devices, id: \.self) { deviceName in
            Group {
                
                UIViewControllerPreview {
                    let vc = MemoryManagmentVC()
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
