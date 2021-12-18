//
//  DebugVC.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 1/30/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import UIKit

final class DebugVC: BaseViewController, DebugVCShowable {
    
    private lazy var contentView: DebugVCView = DebugVCView(frame: UIScreen.main.bounds)
    
    private var tableController: DebugScreenTableController?
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "DebugVC"
        view.accessibilityLabel = "DebugVCView"
        initialSetup()
    }
    
    private func initialSetup() {
        
        tableController = DebugScreenTableController(tableView: contentView.tableView)
        tableController?.delegate = self
        contentView.tableView.reloadData()
        setWhiteNavigationBar()
    }
    
}

// MARK: - DebugScreenTableControllerDelegate
extension DebugVC: DebugScreenTableControllerDelegate {
    
    func didSelectItem(at index: IndexPath, item: DebugScreenTableViewCellVM) {
        
        navigationController?.pushViewController(item.viewController, animated: true)
    }
    
}

#if DEBUG
#if targetEnvironment(simulator)
import SwiftUI

@available(iOS 13.0, *)
struct DebugVC_Previews: PreviewProvider {
    
    static var devices = AppConstants.previewDevices
    
    static var platform: PreviewPlatform? {
        return SwiftUI.PreviewPlatform.iOS
    }
    
    static var previews: some SwiftUI.View {
        
        ForEach(devices, id: \.self) { deviceName in
            Group {
                
                UIViewControllerPreview {
                    let vc = DebugVC()
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
