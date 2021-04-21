//
//  CollectionCellsFactory.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 31.04.2021.
//  Copyright © 2021 Serg Liamtsev. All rights reserved.
//

import UIKit

protocol CollectionViewCell: UICollectionViewCell {
    
}

protocol CollectionViewHeaderFooterView: UICollectionReusableView {
    
    // NOTE: - Should return UICollectionView.elementKindSectionHeader or UICollectionView.elementKindSectionFooter - in order to register headers / footers views properly
    static var viewType: String { get }
}

protocol CollectionCellsFactory {
    
    var cellTypes: [CollectionViewCell.Type] { get }
    
    var headerFooterTypes: [CollectionViewHeaderFooterView.Type] { get }
    
    func registerAllCells(for collectionView: UICollectionView)
    
    func generateCell(for viewModel: CollectionCellModel,
                      collectionView: UICollectionView,
                      at indexPath: IndexPath) -> UICollectionViewCell
    
    // UICollectionView.elementKindSectionHeader
    func generateHeader(for viewModel: CollectionHeaderFooterModel?,
                        collectionView: UICollectionView,
                        at indexPath: IndexPath) -> UICollectionReusableView
    
    // UICollectionView.elementKindSectionFooter
    func generateFooter(for viewModel: CollectionHeaderFooterModel?,
                        collectionView: UICollectionView,
                        at indexPath: IndexPath) -> UICollectionReusableView
    
}
