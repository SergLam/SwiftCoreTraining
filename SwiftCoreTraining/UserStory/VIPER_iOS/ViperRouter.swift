//
//  ViperRouter.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 6/16/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import UIKit

final class ViperRouter: PresenterToRouterProtocol {
    
    static func createModule() -> ViperVC {
        
        let view = ViperVC()
        
        let presenter = ViperPresenter()
        let interactor = ViperInteractor()
        let router = ViperRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    
    func pushToMovieScreen(navigationConroller: UINavigationController) {
        
        let vc = UIViewController()
        navigationConroller.pushViewController(vc, animated: true)
    }
    
}
