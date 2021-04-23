//
//  DebugScreenTableHeaderFooterView.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 21.04.2021.
//  Copyright © 2021 Serg Liamtsev. All rights reserved.
//

import UIKit

public final class DebugScreenTableHeaderFooterView: UITableViewHeaderFooterView, TableViewHeaderFooterView {

    private let cellTextLabel: UILabel = UILabel()
    private let cellTextLabelFont: UIFont = UIFont.systemFont(ofSize: 16.0, weight: .regular)
    
    // MARK: - Life cycle
    public required init?(coder: NSCoder) {
        
        super.init(coder: coder)
    }
    
    public override init(reuseIdentifier: String?) {
        
        super.init(reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    public override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    // MARK: - Public functions
    public func update(with model: DebugScreenTableHeaderFooterViewVM?) {
        
        cellTextLabel.text = model?.data
    }
    
    // MARK: - Private functions
    private func setup() {
        
        setupLayout()
    }
    
    private func setupLayout() {
        
        contentView.backgroundColor = UIColor.blue
        
        contentView.addSubview(cellTextLabel)
        cellTextLabel.font = cellTextLabelFont
        cellTextLabel.numberOfLines = 0
        cellTextLabel.textColor = UIColor.white
        
        cellTextLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let cellTextLabelConstraints: [NSLayoutConstraint] = [
        
            cellTextLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            cellTextLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            cellTextLabel.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -16)
        ]
        
        NSLayoutConstraint.activate(cellTextLabelConstraints)
    }
    
}
