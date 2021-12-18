//
//  PrivacyDetailsCell.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 12/14/21.
//  Copyright © 2021 serglam. All rights reserved.
//

import UIKit

final class PrivacyDetailsCell: UITableViewCell {
    
    static let identifier = String(describing: self)
    
    private let separatorView = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        
        selectionStyle = .none
        backgroundColor = .white
        accessoryType = .none
        textLabel?.numberOfLines = 0
        textLabel?.font = UIFont.systemFont(ofSize: 15)
        
        contentView.addSubview(separatorView)
        separatorView.backgroundColor = .lightGray
        
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        
        let separatorViewConstraints: [NSLayoutConstraint] = [
        
            separatorView.heightAnchor.constraint(equalToConstant: 1.0),
            separatorView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            separatorView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ]
        NSLayoutConstraint.activate(separatorViewConstraints)
        
    }
    
    func update(_ text: String) {
        
        textLabel?.text = text
    }
}

#if DEBUG
#if targetEnvironment(simulator)
import SwiftUI

@available(iOS 13.0, *)
struct PrivacyDetailsCell_Previews: PreviewProvider {
    
    static var devices = AppConstants.previewDevices
    
    static var platform: PreviewPlatform? {
        return SwiftUI.PreviewPlatform.iOS
    }
    
    static var previews: some SwiftUI.View {
        ForEach(devices, id: \.self) { deviceName in
            
            VStack(alignment: .center, spacing: 10) {
                
                UIViewPreview {
                    
                    let view = PrivacyDetailsCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: PrivacyTitleCell.reuseIdentifier)
                    view.update("Title")
                    return view
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 150, alignment: .center)
                
                Spacer()
                
            }.previewDevice(PreviewDevice(rawValue: deviceName))
            .previewDisplayName(deviceName)
        }
        
    }
    
}
#endif
#endif
