//
//  SizeClassesView.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 2/3/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import UIKit
import Kingfisher

final class SizeClassesView: UIView {
    
    let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        let imageViewConstraints: [NSLayoutConstraint] = [
        
            imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 1.67)
        ]
        NSLayoutConstraint.activate(imageViewConstraints)
        
        let url = URL(string: "https://picsum.photos/500/300/?image=702")
        imageView.kf.setImage(with: url)
    }
}
