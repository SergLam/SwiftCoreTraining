//
//  SystemTransitionRootVC.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 4/15/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import UIKit

class SystemTransitionRootVC: BaseViewController {
    
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
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let buttonConstraints: [NSLayoutConstraint] = [
        
            button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            button.widthAnchor.constraint(equalToConstant: 250.0)
        ]
        NSLayoutConstraint.activate(buttonConstraints)
        
    }
    
    @objc
    private func pushVC() {
        let vc = SystemTransitionPushVC()
        navigationController?.addFlipTransition()
        navigationController?.pushViewController(vc, animated: true)
    }
}
