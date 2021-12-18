//
//  PrivacyPolicyView.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 12/14/21.
//  Copyright © 2021 serglam. All rights reserved.
//

import UIKit

protocol PrivacyPolicyViewDelegate: AnyObject {
    
    func didTapCloseButton()
}

final class PrivacyPolicyView: UIView {
    
    weak var delegate: PrivacyPolicyViewDelegate?
    
    private let containerCornerRadius: CGFloat = 40.0
    private let containerBorder: CGFloat = 2.0
    private let containerView = UIView()
    
    private let titleLabel = UILabel()
    
    private let topSeparator = UIImageView()
    private let bottomSeparator = UIImageView()
    
    let tableView = UITableView()
    
    private static let buttonHeigth: CGFloat = 40
    private static let buttonWidth: CGFloat = 120
    private static let buttonSize = CGSize(width: PrivacyPolicyView.buttonWidth,
                                   height: PrivacyPolicyView.buttonHeigth)
    static let buttonFrame = CGRect(origin: .zero, size: buttonSize)
    
    let closeButton = UIButton.creareCloseButton(PrivacyPolicyView.buttonHeigth)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        
        backgroundColor = UIColor.black.withAlphaComponent(0.4)
        
        addSubview(containerView)
        
        containerView.backgroundColor = .white
        containerView.clipsToBounds = true
        containerView.layer.cornerRadius = containerCornerRadius
        containerView.layer.borderColor = UIColor.purple.cgColor
        containerView.layer.borderWidth = containerBorder
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        let containerViewConstraints: [NSLayoutConstraint] = [
        
            containerView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            containerView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            containerView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            containerView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -10)
        ]
        NSLayoutConstraint.activate(containerViewConstraints)
        
        containerView.addSubview(titleLabel)
        
        titleLabel.text = "Privacy policy"
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        titleLabel.textAlignment = .center
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let titleLabelConstraints: [NSLayoutConstraint] = [
        
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -15)
        ]
        NSLayoutConstraint.activate(titleLabelConstraints)
        
        containerView.addSubview(closeButton)
        
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        
        let closeButtonConstraints: [NSLayoutConstraint] = [
        
            closeButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -15),
            closeButton.heightAnchor.constraint(equalToConstant: PrivacyPolicyView.buttonHeigth),
            closeButton.widthAnchor.constraint(equalToConstant: PrivacyPolicyView.buttonWidth),
            closeButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor)
        ]
        NSLayoutConstraint.activate(closeButtonConstraints)
        
        closeButton.addAction = { [unowned self] in
            self.delegate?.didTapCloseButton()
        }
        
        containerView.addSubview(bottomSeparator)
        bottomSeparator.backgroundColor = .blue
        
        bottomSeparator.translatesAutoresizingMaskIntoConstraints = false
        
        let bottomSeparatorConstraints: [NSLayoutConstraint] = [
        
            bottomSeparator.bottomAnchor.constraint(equalTo: closeButton.topAnchor, constant: -10),
            bottomSeparator.heightAnchor.constraint(equalToConstant: 1),
            bottomSeparator.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            bottomSeparator.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
        ]
        NSLayoutConstraint.activate(bottomSeparatorConstraints)
        
        containerView.addSubview(tableView)
        
        topSeparator.frame.size.height = 1.0
        topSeparator.backgroundColor = .blue
        tableView.tableHeaderView = topSeparator
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        let tableViewConstraints: [NSLayoutConstraint] = [
        
            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            tableView.bottomAnchor.constraint(equalTo: bottomSeparator.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
        ]
        NSLayoutConstraint.activate(tableViewConstraints)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let gradient = UIView.createLinearGradient([.red,
                                                    .blue,
                                                    .green], PrivacyPolicyView.buttonFrame)
        closeButton.layer.insertSublayer(gradient, at: 0)
    }
    
}

#if DEBUG
#if targetEnvironment(simulator)
#if canImport(SwiftUI)
import SwiftUI
#endif

@available(iOS 13.0, *)
struct PrivacyPolicyView_Previews: PreviewProvider {
    
    static var devices = AppConstants.previewDevices
    
    static var platform: PreviewPlatform? {
        return SwiftUI.PreviewPlatform.iOS
    }
    
    static var previews: some SwiftUI.View {
        ForEach(devices, id: \.self) { deviceName in
            Group {
                UIViewPreview {
                    
                    let view = PrivacyPolicyView()
                    return view
                }
            }.previewDevice(PreviewDevice(rawValue: deviceName))
            .previewDisplayName(deviceName)
        }
        
    }
    
}
#endif
#endif
