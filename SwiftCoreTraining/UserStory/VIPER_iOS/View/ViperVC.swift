//
//  ViperVC.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 6/16/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import UIKit

final class ViperVC: BaseViewController {

    var presenter: ViewToPresenterProtocol?
    private var personsList: [PersonModel] = []
    
    private let contentView = ViperView()
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = String(describing: ViperVC.self)
        showProgress()
        presenter?.startFetchingPersons()
        configureTableView()
    }
    
    private func configureTableView() {
        
        contentView.tableView.register(PersonCell.self)
        contentView.tableView.separatorStyle = .none
        contentView.tableView.delegate = self
        contentView.tableView.dataSource = self
    }
    
}

// MARK: UITableViewDataSource + UITableViewDelegate
extension ViperVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(PersonCell.self, for: indexPath)
        cell.update(personsList[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
}

// MARK: UITableViewDelegate
extension ViperVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let navVC = self.navigationController else {
            assertionFailure("Unable to get navigetion controller")
            return
        }
        presenter?.router?.pushToMovieScreen(navigationConroller: navVC)
    }
    
}

// MARK: PresenterToViewProtocol
extension ViperVC: PresenterToViewProtocol {
    
    func showPersons(personsArray: [PersonModel]) {
        
        hideProgress()
        personsList = personsArray
        contentView.tableView.reloadData()
    }
    
    func showError(error: String) {
        
        hideProgress { [unowned self] in
            AlertPresenter.showErrorAlert(at: self, error: error)
        }
    }
    
}
