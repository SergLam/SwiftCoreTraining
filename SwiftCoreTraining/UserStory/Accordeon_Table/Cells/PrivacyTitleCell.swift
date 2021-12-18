//
//  PrivacyTitleCell.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 12/14/21.
//  Copyright © 2021 serglam. All rights reserved.
//

import UIKit

final class PrivacyTitleCell: UITableViewCell {
    
    static let identifier = "PrivacyTitleCell"
    
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
        textLabel?.numberOfLines = 0
        textLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        
        addSubview(separatorView)
        separatorView.backgroundColor = .gray
        
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        
        let separatorViewConstraints: [NSLayoutConstraint] = [
        
            separatorView.heightAnchor.constraint(equalToConstant: 1.0),
            separatorView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            separatorView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ]
        NSLayoutConstraint.activate(separatorViewConstraints)
        
    }
    
    func update(_ titleText: String, _ shouldExpand: Bool) {
        
        textLabel?.text = titleText
        
        let button = UIButton(type: .custom)
        button.bounds.size = CGSize(width: 15, height: 15)
        button.setImage(UIImage(named: "disclosureIndicatorGray"), for: .normal)
        
        if !shouldExpand {
            let rotationTransform = CGAffineTransform(rotationAngle: CGFloat.pi / 2)
            button.transform = rotationTransform
        }
        accessoryView = button
    }
    
}

#if DEBUG
#if targetEnvironment(simulator)
import SwiftUI

@available(iOS 13.0, *)
struct PrivacyTitleCell_Previews: PreviewProvider {
    
    static var devices = AppConstants.previewDevices
    
    static var platform: PreviewPlatform? {
        return SwiftUI.PreviewPlatform.iOS
    }
    
    static var previews: some SwiftUI.View {
        ForEach(devices, id: \.self) { deviceName in
            
            VStack(alignment: .center, spacing: 10) {
                
                UIViewPreview {
                    
                    let view = PrivacyTitleCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: PrivacyTitleCell.reuseIdentifier)
                    view.update("Title", true)
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
