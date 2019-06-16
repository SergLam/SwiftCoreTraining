//
//  VIPERProtocols.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 6/16/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import Foundation
import UIKit

protocol ViewToPresenterProtocol: class {
    
    var view: PresenterToViewProtocol? { get set }
    var interactor: PresenterToInteractorProtocol? { get set }
    var router: PresenterToRouterProtocol? { get set }
    func startFetchingPersons()
    func showMovieController(navigationController: UINavigationController)
    
}

protocol PresenterToViewProtocol: class {
    
    func showPersons(personsArray: Array<PersonModel>)
    func showError(error: String)
}

protocol PresenterToRouterProtocol: class {
    
    static func createModule() -> ViperVC
    func pushToMovieScreen(navigationConroller: UINavigationController)
}

protocol PresenterToInteractorProtocol: class {
    
    var presenter:InteractorToPresenterProtocol? { get set }
    func fetchPersons()
}

protocol InteractorToPresenterProtocol: class {
    
    func personsFetchedSuccess(personsModelArray: Array<PersonModel>)
    func personsFetchFailed(error: String)
}
