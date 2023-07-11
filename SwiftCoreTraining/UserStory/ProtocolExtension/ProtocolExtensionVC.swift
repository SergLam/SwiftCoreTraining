//
//  ProtocolExtensionVC.swift
//  SwiftCoreTraining
//
//  Created by Serhii Liamtsev on 8/1/22.
//  Copyright © 2022 Serg Liamtsev. All rights reserved.
//

import UIKit

/// Protocol extensions + default methods implementations demo
final class ProtocolExtensionVC: BaseViewController {
    
    private let viewModelClass: ProtocolExtensionVCViewModel = ProtocolExtensionVCViewModel()
    
    private let viewModelProtocol: SampleProtocol = ProtocolExtensionVCViewModel()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        configureNavBar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Protocol Extension class sample:")
        viewModelClass.foo()
        viewModelClass.bar()
        print("Protocol Extension protocol sample:")
        viewModelProtocol.foo()
        viewModelProtocol.bar()
    }
    
    // MARK: - Private
    private func configureNavBar() {
        navigationItem.title = "Protocol Extension"
    }
    
}

#if DEBUG
#if targetEnvironment(simulator)
import SwiftUI

@available(iOS 13.0, *)
struct ProtocolExtensionVC_Previews: PreviewProvider {
    
    static var devices = AppConstants.previewDevices
    
    static var platform: PreviewPlatform? {
        return SwiftUI.PreviewPlatform.iOS
    }
    
    static var previews: some SwiftUI.View {
        
        ForEach(devices, id: \.self) { deviceName in
            Group {
                
                UIViewControllerPreview {
                    let vc = CombineVC()
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
