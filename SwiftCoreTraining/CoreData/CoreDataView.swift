//
//  CoreDataView.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 4/21/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import UIKit

class CoreDataView: UIView {
    
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
        scrollView.snp.makeConstraints { (make) in
            make.edges.equalTo(safeAreaLayoutGuide.snp.edges)
        }
        
        scrollView.addSubview(contentView)
        contentView.backgroundColor = .white
        contentView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview().priority(.low)
        }
        
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.height.equalToSuperview().priority(.low)
        }
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 10.0
        
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
