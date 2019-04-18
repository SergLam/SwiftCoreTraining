//
//  AppDelegate.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 1/26/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import UIKit
import Rswift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        let navVC = UINavigationController(rootViewController: DebugVC())
        window?.rootViewController = navVC
        window?.makeKeyAndVisible()
        return true
    }

}

