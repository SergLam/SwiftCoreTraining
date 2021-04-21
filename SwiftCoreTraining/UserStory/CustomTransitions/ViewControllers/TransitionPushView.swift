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
