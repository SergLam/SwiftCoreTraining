//
//  ProgressShowable.swift
//  Superfy
//
//  Created by IdeaSoft on 5/20/19.
//  Copyright © 2019 Aleksandr Zhovtyi. All rights reserved.
//

import UIKit
import SVProgressHUD

protocol ProgressShowable {
    
    func showProgress()
    func hideProgress()
    func hideProgress(completion: @escaping VoidClosure)
}

extension ProgressShowable where Self: UIViewController {
    
    func showProgress() {
        
        DispatchQueue.main.async {
            SVProgressHUD.setDefaultMaskType(.clear)
            SVProgressHUD.show(withStatus: Localizable.loading())
        }
    }
    
    func hideProgress() {
        
        DispatchQueue.main.async {
            SVProgressHUD.dismiss()
        }
    }
    
    func hideProgress(completion: @escaping VoidClosure) {
        DispatchQueue.main.async {
            SVProgressHUD.dismiss(completion: {
                completion()
            })
        }
    }
}
