//
//  UIViewController+NavBar.swift
//  SwiftCoreTraining
//
//  Created by Serhii Liamtsev on 4/23/21.
//  Copyright © 2021 Serg Liamtsev. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func setLargeTitleDisplayMode(_ largeTitleDisplayMode: UINavigationItem.LargeTitleDisplayMode) {
        switch largeTitleDisplayMode {
        case .automatic:
              guard let navigationController = navigationController else { break }
            if let index = navigationController.children.firstIndex(of: self) {
                setLargeTitleDisplayMode(index == 0 ? .always : .never)
            } else {
                setLargeTitleDisplayMode(.always)
            }
        case .always, .never:
            
            // Even when .never, needs to be true otherwise animation will be broken on iOS11, 12, 13
            if #available(iOS 11.0, *) {
                navigationItem.largeTitleDisplayMode = largeTitleDisplayMode
                navigationController?.navigationBar.prefersLargeTitles = true
            }
            
        @unknown default:
            assertionFailure("Missing handler for \(largeTitleDisplayMode)")
        }
    }
    
    func setLargeTransparentNavigationBar() {
        
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
        }
        navigationController?.navigationBar.shadowImage = nil
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    }
    
    func setWhiteNavigationBar() {
        
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = false
        }
        navigationController?.navigationBar.shadowImage = nil
        guard let image = UIImage(color: .white) else {
            assertionFailure("Unable to create image")
            return
        }
        navigationController?.navigationBar.setBackgroundImage(image, for: .default)
    }
    
    func setBlackNavigationBar() {
        
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = false
        }
        navigationController?.navigationBar.shadowImage = nil
        navigationController?.navigationBar.tintColor = .white
        guard let image = UIImage(color: .black) else {
            assertionFailure("Unable to create image")
            return
        }
        navigationController?.navigationBar.setBackgroundImage(image, for: .default)
    }
    
    func setTransparentNavigationBar() {
        
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = false
        }
        navigationController?.navigationBar.shadowImage = nil
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    }
    
    func setNavigationBarBackButtonTitle(_ title: String) {
        
        let backItem = UIBarButtonItem(title: title, style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backItem
    }
    
}
