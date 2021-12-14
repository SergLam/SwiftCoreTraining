//
//  VIPERProtocols.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 6/16/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import Foundation
import UIKit

protocol ViewToPresenterProtocol: AnyObject {
    
    var view: PresenterToViewProtocol? { get set }
    var interactor: PresenterToInteractorProtocol? { get set }
    var router: PresenterToRouterProtocol? { get set }
    func startFetchingPersons()
    func showMovieController(navigationController: UINavigationController)
    
}

protocol PresenterToViewProtocol: AnyObject {
    
    func showPersons(personsArray: [PersonModel])
    func showError(error: String)
}

protocol PresenterToRouterProtocol: AnyObject {
    
    static func createModule() -> ViperVC
    func pushToMovieScreen(navigationConroller: UINavigationController)
}

protocol PresenterToInteractorProtocol: AnyObject {
    
    var presenter: InteractorToPresenterProtocol? { get set }
    func fetchPersons()
}

protocol InteractorToPresenterProtocol: AnyObject {
    
    func personsFetchedSuccess(personsModelArray: [PersonModel])
    func personsFetchFailed(error: String)
}
