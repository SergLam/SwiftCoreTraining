//
//  CoreDataView.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 4/21/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import UIKit

final class CoreDataView: UIView {
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    let stackView = UIStackView()
    var buttons: [UIButton] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        generateButtons()
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        generateButtons()
        setupLayout()
    }
    
    private func setupLayout() {
        
        backgroundColor = .white
        addSubview(scrollView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        let scrollViewConstraints: [NSLayoutConstraint] = [
        
            scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor)
        ]
        NSLayoutConstraint.activate(scrollViewConstraints)
        
        scrollView.addSubview(contentView)
        contentView.backgroundColor = .white
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        let contentViewHeightConstraint: NSLayoutConstraint = contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        contentViewHeightConstraint.priority = UILayoutPriority(250)
        let contentViewConstraints: [NSLayoutConstraint] = [
        
            contentView.topAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentViewHeightConstraint
        ]
        NSLayoutConstraint.activate(contentViewConstraints)
        
        contentView.addSubview(stackView)
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 10.0
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let stackViewHeightConstraint: NSLayoutConstraint = stackView.heightAnchor.constraint(equalTo: contentView.heightAnchor)
        stackViewHeightConstraint.priority = UILayoutPriority(250)
        
        let stackViewBottomConstraint: NSLayoutConstraint =
            stackView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor)
        stackViewBottomConstraint.priority = UILayoutPriority(250)
        
        let stackViewConstraints: [NSLayoutConstraint] = [
        
            stackView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            stackViewBottomConstraint,
            stackView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor),
            stackViewHeightConstraint
        ]
        NSLayoutConstraint.activate(stackViewConstraints)
        
        for button in buttons {
            stackView.addArrangedSubview(button)
        }
        
    }
    
    private func generateButtons() {
        for operation in CoreDataOpetations.allCases {
            let button = UIButton.createGrayButton()
            button.setTitle(operation.rawValue, for: .normal)
            buttons.append(button)
        }
    }
    
}

#if DEBUG
#if targetEnvironment(simulator)
#if canImport(SwiftUI)
import SwiftUI
#endif

@available(iOS 13.0, *)
struct CoreDataView_Previews: PreviewProvider {
    
    static var devices = AppConstants.previewDevices
    
    static var platform: PreviewPlatform? {
        return SwiftUI.PreviewPlatform.iOS
    }
    
    static var previews: some SwiftUI.View {
        ForEach(devices, id: \.self) { deviceName in
            Group {
                UIViewPreview {
                    
                    let view = CoreDataView()
                    return view
                }
            }.previewDevice(PreviewDevice(rawValue: deviceName))
            .previewDisplayName(deviceName)
        }
        
    }
    
}
#endif
#endif
