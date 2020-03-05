//
//  ExternalURLOpenable.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 6/1/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import SafariServices
import UIKit

protocol ExternalURLOpenable {
    func openURL(_ urlString: String)
}

extension ExternalURLOpenable where Self: BaseViewController {
    
    func openURL(_ urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        let safariVC = SFSafariViewController(url: url)
        safariVC.delegate = self
        safariVC.modalPresentationStyle = .overFullScreen
        present(safariVC, animated: true, completion: nil)
    }
    
}
