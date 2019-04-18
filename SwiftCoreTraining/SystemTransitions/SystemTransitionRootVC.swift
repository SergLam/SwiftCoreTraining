//
//  SystemTransitionRootVC.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 4/15/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import UIKit

class SystemTransitionRootVC: UIViewController {
    
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    private func setupLayout() {
        view.backgroundColor = .blue
        view.addSubview(button)
     
        button.layer.borderWidth = 2.0
        button.layer.borderColor = UIColor.red.cgColor
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        button.setTitle("Push view controler", for: .normal)
        button.addTarget(self, action: #selector(pushVC), for: .touchUpInside)
        
        button.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalTo(250)
        }
    }
    
    @objc func pushVC() {
        let vc = SystemTransitionPushVC()
        navigationController?.addFlipTransition()
        navigationController?.pushViewController(vc, animated: true)
    }
}
