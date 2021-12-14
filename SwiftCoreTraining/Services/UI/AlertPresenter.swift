//
//  AlertPresenter.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 3/23/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import UIKit

class AlertPresenter {
    
    static func showErrorAlert(at vc: UIViewController, error: String) {
        let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default) { _ in }
        alert.addAction(action)
        vc.present(alert, animated: true, completion: nil)
    }
    
    static func showSuccessMessage(at vc: UIViewController, message: String) {
        let alert = UIAlertController(title: "Success", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default) { _ in }
        alert.addAction(action)
        vc.present(alert, animated: true, completion: nil)
    }
    
    static func showInputAlert(at vc: UIViewController,
                               message: String,
                               placeholder: String? = nil,
                               completion: @escaping (String) -> Void) {
        let alert = UIAlertController(title: "Input data", message: message, preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = placeholder
            textField.keyboardAppearance = .alert
            textField.keyboardType = .asciiCapable
        }
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            guard let text = alert.textFields?.first?.text else {
                completion("")
                return
            }
            completion(text)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default)
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        vc.present(alert, animated: true, completion: nil)
    }
    
    static func showSocketEventDescription(at vc: UIViewController, title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default) { _ in }
        alert.addAction(action)
        vc.present(alert, animated: true, completion: nil)
    }
    
}
