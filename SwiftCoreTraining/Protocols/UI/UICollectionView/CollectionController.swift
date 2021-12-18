//
//  CollectionController.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 31.04.2021.
//  Copyright © 2021 Serg Liamtsev. All rights reserved.
//

import UIKit

protocol CollectionSectionVM {
    
    var header: CollectionHeaderFooterModel? { get set }
    var footer: CollectionHeaderFooterModel? { get set }
    var cells: [CollectionCellModel] { get set }
}

protocol CollectionController: NSObject, UICollectionViewDataSource & UICollectionViewDelegate & UICollectionViewDelegateFlowLayout {
    
    var updatesQueue: DispatchQueue { get set }
    
    var dataSource: [CollectionSectionVM] { get set }
    
    var factory: CollectionCellsFactory { get set }
    
    var collectionView: UICollectionView { get set }
    
    init(collectionView: UICollectionView)
    
    func updateDataSource(with newItems: [CollectionCellModel], animated: Bool)
    
}
