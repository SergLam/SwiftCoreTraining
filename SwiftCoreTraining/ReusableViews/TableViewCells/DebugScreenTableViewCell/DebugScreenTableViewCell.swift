//
//  DebugScreenTableViewCell.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 21.04.2021.
//  Copyright © 2021 Serg Liamtsev. All rights reserved.
//

import UIKit

final class DebugScreenTableViewCell: UITableViewCell, TableViewCell {
    
    private let cellTextLabel: UILabel = UILabel()
    private let cellTextLabelFont: UIFont = UIFont.systemFont(ofSize: 16.0, weight: .regular)
    
    private let bottomSeparatorView: UIView = UIView()
    private let bottomSeparatorViewColor: UIColor = UIColor.systemGray
    
    // MARK: - Life cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    // MARK: - Public functions
    func configureWithModel(_ model: DebugScreenTableViewCellVM?) {
        
        cellTextLabel.text = model?.data
    }
    
    // MARK: - Private functions
    private func setup() {
        
        selectionStyle = .none
        setupLayout()
    }
    
    private func setupLayout() {
        
        contentView.addSubview(cellTextLabel)
        cellTextLabel.font = cellTextLabelFont
        cellTextLabel.numberOfLines = 0
        
        cellTextLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let cellTextLabelConstraints: [NSLayoutConstraint] = [
        
            cellTextLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            cellTextLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            cellTextLabel.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -16)
        ]
        
        NSLayoutConstraint.activate(cellTextLabelConstraints)
        
        contentView.addSubview(bottomSeparatorView)
        bottomSeparatorView.backgroundColor = bottomSeparatorViewColor
        
        bottomSeparatorView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bottomSeparatorView.heightAnchor.constraint(equalToConstant: 0.5),
            bottomSeparatorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            bottomSeparatorView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            bottomSeparatorView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
}
