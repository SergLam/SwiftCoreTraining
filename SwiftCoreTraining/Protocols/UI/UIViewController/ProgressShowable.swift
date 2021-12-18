//
//  ProgressShowable.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 6/1/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import UIKit

protocol ProgressShowable {
    
    func showProgress()
    func hideProgress()
    func hideProgress(completion: @escaping VoidClosure)
}

extension ProgressShowable where Self: BaseViewController {
    
    func showProgress() {
        
        executeOnMain { [weak self] in
            guard let self = self else { return }
            
            self.addChild(self.hud)
            self.hud.view.frame = self.view.frame
            self.view.addSubview(self.hud.view)
            self.hud.didMove(toParent: self)
            
        }
    }
    
    func hideProgress() {
        
        executeOnMain { [weak self] in
            
            self?.hud.willMove(toParent: nil)
            self?.hud.view.removeFromSuperview()
            self?.hud.removeFromParent()
        }
    }
    
    func hideProgress(completion: @escaping VoidClosure) {
        
        executeOnMain { [weak self] in
            
            self?.hud.willMove(toParent: nil)
            self?.hud.view.removeFromSuperview()
            self?.hud.removeFromParent()
            completion()
        }
    }
    
}
