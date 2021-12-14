//
//  ViperPresenter.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 6/16/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import Foundation
import UIKit

final class ViperPresenter: ViewToPresenterProtocol {
    
    var view: PresenterToViewProtocol?
    
    var interactor: PresenterToInteractorProtocol?
    
    var router: PresenterToRouterProtocol?
    
    func startFetchingPersons() {
        interactor?.fetchPersons()
    }
    
    func showMovieController(navigationController: UINavigationController) {
        router?.pushToMovieScreen(navigationConroller: navigationController)
    }
    
}

extension ViperPresenter: InteractorToPresenterProtocol {
    
    func personsFetchedSuccess(personsModelArray: [PersonModel]) {
        view?.showPersons(personsArray: personsModelArray)
    }
    
    func personsFetchFailed(error: String) {
        view?.showError(error: error)
    }
    
}
