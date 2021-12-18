//
//  ClosuresVCView.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 09.11.2020.
//  Copyright © 2020 serglam. All rights reserved.
//

import UIKit

final class ClosuresVCView: UIView {
    
    // MARK: - Life cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    // MARK: - Private functions
    private func setup() {
        setupLayout()
    }
    
    private func setupLayout() {
        
    }
    
}

#if DEBUG
#if targetEnvironment(simulator)
#if canImport(SwiftUI)
import SwiftUI
#endif

@available(iOS 13.0, *)
struct ClosuresVCView_Previews: PreviewProvider {
    
    static var devices = AppConstants.previewDevices
    
    static var platform: PreviewPlatform? {
        return SwiftUI.PreviewPlatform.iOS
    }
    
    static var previews: some SwiftUI.View {
        ForEach(devices, id: \.self) { deviceName in
            Group {
                UIViewPreview {
                    
                    let view = ClosuresVCView()
                    return view
                }
            }.previewDevice(PreviewDevice(rawValue: deviceName))
            .previewDisplayName(deviceName)
        }
        
    }
    
}
#endif
#endif
