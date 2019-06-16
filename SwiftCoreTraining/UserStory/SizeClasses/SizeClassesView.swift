//
//  SizeClassesView.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 2/3/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

class SizeClassesView: UIView {
    
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
        imageView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(UIScreen.main.bounds.width * 1.67)
        }
        let url = URL(string: "https://picsum.photos/500/300/?image=702")
        imageView.kf.setImage(with: url)
    }
}
