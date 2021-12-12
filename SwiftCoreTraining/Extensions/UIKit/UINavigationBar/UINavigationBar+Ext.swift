//
//  UINavigationBar+Color.swift
//  SwiftCoreTraining
//
//  Created by Serhii Liamtsev on 12/12/21.
//  Copyright © 2021 Serg Liamtsev. All rights reserved.
//

import UIKit

extension UINavigationBar {
    
    private static let defaultBackgroundColor = UIColor.white
    private static let defaultTintColor = UIColor.systemBlue
    
    func setOpaque(showShadow: Bool) {
        if #available(iOS 15, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.shadowColor = showShadow ? UIColor.shadow : UIColor.clear
            shadowImage = showShadow ? UIImage(color: UIColor.shadow) : nil
            appearance.backgroundColor = UINavigationBar.defaultBackgroundColor
            guard let image = UIImage(color: UINavigationBar.defaultBackgroundColor) else {
                LoggerService.logErrorWithTrace("Unable to create image")
                return
            }
            appearance.backgroundImage = image
            appearance.titleTextAttributes = [.foregroundColor: UINavigationBar.defaultTintColor]
            
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
            
        } else {
            
            if showShadow {
                layer.shadowColor = UIColor.shadow.cgColor
                layer.shadowOpacity = 1
                layer.shadowOffset = CGSize(width: 0, height: 2)
                layer.shadowRadius = 2
                shadowImage = UIImage()
            }
            setBackgroundImage(UIImage(color: UIColor.white), for: UIBarPosition.any, barMetrics: UIBarMetrics.defaultPrompt)
            barTintColor = UINavigationBar.defaultBackgroundColor
            titleTextAttributes = [.foregroundColor: UINavigationBar.defaultTintColor]
        }
        isTranslucent = false
        tintColor = UINavigationBar.defaultTintColor
    }
    
    func setTranslucent(tintColor: UIColor,
                        titleColor: UIColor,
                        showShadow: Bool) {
        if #available(iOS 15, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.shadowColor = showShadow ? UIColor.shadow : UIColor.clear
            shadowImage = showShadow ? UIImage(color: UIColor.shadow) : nil
            appearance.backgroundColor = UINavigationBar.defaultBackgroundColor
            appearance.titleTextAttributes = [.foregroundColor: titleColor]
            standardAppearance = appearance
            scrollEdgeAppearance = appearance
            
        } else {
            
            if showShadow {
                layer.shadowColor = UIColor.shadow.cgColor
                layer.shadowOpacity = 1
                layer.shadowOffset = CGSize(width: 0, height: 2)
                layer.shadowRadius = 2
                
                barTintColor = .white
                backgroundColor = .white
                shadowImage = UIImage()
            }
            titleTextAttributes = [.foregroundColor: titleColor]
            setBackgroundImage(UIImage(), for: UIBarMetrics.default)
            shadowImage = UIImage()
        }
        isTranslucent = true
        self.tintColor = tintColor
    }
    
}
