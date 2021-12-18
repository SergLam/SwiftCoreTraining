//
//  PrivacyPolicyVC.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 12/14/21.
//  Copyright © 2021 serglam. All rights reserved.
//

import UIKit

final class PrivacyPolicyVC: BaseViewController {
    
    private let contentView = PrivacyPolicyView()
    
    private let tableText: [String] = ["Title1", "Lorem ipsum0",
    "Title2", "Lorem ipsum1",
    "Title3", "Lorem ipsum2",
    "Title4", "Lorem ipsum3",
    "Title5", "Lorem ipsum4",
    "Title6", "Lorem ipsum5",
    "Title7", "Lorem ipsum6",
    "Title8", "Lorem ipsum7",
    "Title9", "Lorem ipsum8",
    "Title10", "Lorem ipsum9"]
    
    private var cellStates: [Bool] = []
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        configurePresentationStyle()
        cellStates = Array(repeating: true, count: tableText.count)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        contentView.delegate = self
        configureTableView()
    }
    
    private func configurePresentationStyle() {
        
        providesPresentationContextTransitionStyle = true
        definesPresentationContext = true
        modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        modalTransitionStyle = UIModalTransitionStyle.crossDissolve
    }
    
    private func configureTableView() {
        
        contentView.tableView.separatorStyle = .none
        contentView.tableView.bounces = false
        contentView.tableView.allowsMultipleSelection = false
        contentView.tableView.estimatedRowHeight = 45
        contentView.tableView.rowHeight = UITableView.automaticDimension
        
        contentView.tableView.register(PrivacyTitleCell.self, forCellReuseIdentifier: PrivacyTitleCell.identifier)
        
        contentView.tableView.register(PrivacyDetailsCell.self, forCellReuseIdentifier: PrivacyDetailsCell.identifier)
        
        contentView.tableView.delegate = self
        contentView.tableView.dataSource = self
    }
    
}

// MARK: - UITableViewDataSource
extension PrivacyPolicyVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableText.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row % 2 == 0 {
        case true:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PrivacyTitleCell.identifier, for: indexPath) as? PrivacyTitleCell else {
                assertionFailure("Unable to dequeue cell")
                return UITableViewCell()
            }
            cell.update(tableText[indexPath.row], cellStates[indexPath.row])
            return cell
            
        case false:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PrivacyDetailsCell.identifier, for: indexPath) as? PrivacyDetailsCell else {
                assertionFailure("Unable to dequeue cell")
                return UITableViewCell()
            }
            cell.update(tableText[indexPath.row])
            return cell
            
        }
    }
    
}

// MARK: - UITableViewDelegate
extension PrivacyPolicyVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.row % 2 == 0 {
        case true:
            return 55
            
        case false:
            let path = IndexPath(row: indexPath.row - 1, section: 0)
            let shouldExpand = cellStates[path.row]
            return shouldExpand ? 0 : UITableView.automaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard indexPath.row % 2 == 0 else {
            return
        }
        
        var indexes: [IndexPath] = []
        for index in cellStates.indices {
            
            if index % 2 == 0 {
                indexes.append(IndexPath(row: index, section: 0))
            }
            
            if index == indexPath.row {
                cellStates[indexPath.row] = !cellStates[indexPath.row]
            } else {
                cellStates[index] = true
            }
        }
        
        contentView.tableView.beginUpdates()
        contentView.tableView.reloadRows(at: indexes, with: .none)
        contentView.tableView.endUpdates()
    }
    
}

// MARK: - PrivacyPolicyViewDelegate
extension PrivacyPolicyVC: PrivacyPolicyViewDelegate {
    
    func didTapCloseButton() {
        
        dismiss(animated: true, completion: nil)
    }
    
}

#if DEBUG
#if targetEnvironment(simulator)
import SwiftUI

@available(iOS 13.0, *)
struct PrivacyPolicyVC_Previews: PreviewProvider {
    
    static var devices = AppConstants.previewDevices
    
    static var platform: PreviewPlatform? {
        return SwiftUI.PreviewPlatform.iOS
    }
    
    static var previews: some SwiftUI.View {
        
        ForEach(devices, id: \.self) { deviceName in
            Group {
                
                UIViewControllerPreview {
                    let vc = PrivacyPolicyVC()
                    let navVC = UINavigationController(rootViewController: vc)
                    return navVC
                }
                
            }.previewDevice(PreviewDevice(rawValue: deviceName))
            .previewDisplayName(deviceName)
        }
        
    }
}
#endif
#endif
