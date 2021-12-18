//
//  BaseViewController.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 1/30/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import MessageUI
import SafariServices
import UIKit

class BaseViewController: UIViewController, ProgressShowable, ExternalURLOpenable, StatusBarResizable, UniqueIdentifiable {
    
    var identifier: UUID = UUID()
    
    var hud: SpinnerVC = SpinnerVC()
    
    // MARK: - Life cycle
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeSwipeBackGestureState(isEnabled: true)
    }
    
    // MARK: - Public functions
    func changeSwipeBackGestureState(isEnabled: Bool) {
        navigationController?.interactivePopGestureRecognizer?.delegate = isEnabled ? self : nil
    }
    
    func shareAppViaiMessage(_ bodyText: String) {
        
        let messageVC = MFMessageComposeViewController()
        messageVC.body = bodyText
        messageVC.recipients = []
        messageVC.messageComposeDelegate = self
        if let presentedVC = self.presentedViewController {
            presentedVC.dismiss(animated: true, completion: { [weak self] in
                self?.present(messageVC, animated: true, completion: nil)
            })
        } else {
            present(messageVC, animated: true, completion: nil)
        }
    }
    
}

// MARK: - MFMailComposeViewControllerDelegate
extension BaseViewController: MFMailComposeViewControllerDelegate {
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
}

// MARK: - MFMessageComposeViewControllerDelegate
extension BaseViewController: MFMessageComposeViewControllerDelegate {
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        
        switch result {
            
        case .cancelled, .failed:
            dismiss(animated: true, completion: nil)
            
        case .sent:
            break
            
        @unknown default:
            assertionFailure("Unknown MessageComposeResult")
        }
    }
    
}

// MARK: - UIGestureRecognizerDelegate
extension BaseViewController: UIGestureRecognizerDelegate {

    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
}

// MARK: - SFSafariViewControllerDelegate
extension BaseViewController: SFSafariViewControllerDelegate {
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        dismiss(animated: true, completion: nil)
    }
    
}

#if DEBUG
#if targetEnvironment(simulator)
import SwiftUI

@available(iOS 13.0, *)
struct BaseViewController_Previews: PreviewProvider {
    
    static var devices = AppConstants.previewDevices
    
    static var platform: PreviewPlatform? {
        return SwiftUI.PreviewPlatform.iOS
    }
    
    static var previews: some SwiftUI.View {
        
        ForEach(devices, id: \.self) { deviceName in
            Group {
                
                UIViewControllerPreview {
                    let vc = BaseViewController()
                    let navVC = UINavigationController(rootViewController: vc)
                    return navVC
                }
                
            }.previewDevice(PreviewDevice(rawValue: deviceName))
            .previewDisplayName(deviceName)
        }
        
    }
}
#endif
#endif
