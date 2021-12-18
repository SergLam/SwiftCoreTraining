//
//  DebugVCView.swift
//  SwiftCoreTraining
//
//  Created by Serhii Liamtsev on 4/23/21.
//  Copyright © 2021 Serg Liamtsev. All rights reserved.
//

import UIKit

final class DebugVCView: UIView {
    
    let tableView: UITableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        
        backgroundColor = UIColor.white
        
        addSubview(tableView)
        tableView.contentMode = .scaleAspectFit
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        let tableViewConstraints: [NSLayoutConstraint] = [
            
            tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor)
        ]
        NSLayoutConstraint.activate(tableViewConstraints)
        
    }
}

#if DEBUG
#if targetEnvironment(simulator)
#if canImport(SwiftUI)
import SwiftUI
#endif

@available(iOS 13.0, *)
struct DebugVCView_Previews: PreviewProvider {
    
    static var devices = AppConstants.previewDevices
    
    static var platform: PreviewPlatform? {
        return SwiftUI.PreviewPlatform.iOS
    }
    
    static var previews: some SwiftUI.View {
        ForEach(devices, id: \.self) { deviceName in
            Group {
                UIViewPreview {
                    
                    let view = DebugVCView()
                    return view
                }
            }.previewDevice(PreviewDevice(rawValue: deviceName))
            .previewDisplayName(deviceName)
        }
        
    }
    
}
#endif
#endif
