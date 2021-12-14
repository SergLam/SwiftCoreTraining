//
//  AppDelegate.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 1/26/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import CoreData
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let navVC = UINavigationController(rootViewController: DebugVC())
        navVC.setWhiteNavigationBar()
        window?.rootViewController = navVC
        window?.makeKeyAndVisible()
        return true
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        
        CoreDataManager.shared?.saveContext(completion: { _ in })
    }
    
}
