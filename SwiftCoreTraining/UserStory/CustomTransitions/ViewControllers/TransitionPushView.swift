//
//  TransitionPushView.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 4/14/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import UIKit

final class TransitionPushView: UIView {
    
    let bigImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLayout()
    }
    
    private func setupLayout() {
        
        backgroundColor = .white
        addSubview(bigImageView)
        
        bigImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let bigImageViewConstraints: [NSLayoutConstraint] = [
        
            bigImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            bigImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            bigImageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            bigImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width)
        ]
        NSLayoutConstraint.activate(bigImageViewConstraints)
        
        bigImageView.image = UIImage(named: "avatarPlaceholder")
    }
}

#if DEBUG
#if targetEnvironment(simulator)
#if canImport(SwiftUI)
import SwiftUI
#endif

@available(iOS 13.0, *)
struct TransitionPushView_Previews: PreviewProvider {
    
    static var devices = AppConstants.previewDevices
    
    static var platform: PreviewPlatform? {
        return SwiftUI.PreviewPlatform.iOS
    }
    
    static var previews: some SwiftUI.View {
        ForEach(devices, id: \.self) { deviceName in
            Group {
                UIViewPreview {
                    
                    let view = TransitionPushView()
                    return view
                }
            }.previewDevice(PreviewDevice(rawValue: deviceName))
            .previewDisplayName(deviceName)
        }
        
    }
    
}
#endif
#endif
