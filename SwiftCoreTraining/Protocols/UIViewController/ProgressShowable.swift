//
//  ProgressShowable.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 6/1/19.
//  Copyright © 2019 serglam. All rights reserved.
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
            SVProgressHUD.show(withStatus: "loading".localized)
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
