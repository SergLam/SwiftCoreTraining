//
//  Router.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 03.03.2020.
//  Copyright © 2020 serglam. All rights reserved.
//

import UIKit

/// protocol that Router must conform. Conteins all requried methods for
protocol Router {
        
    /// Root UINavigationController.
    var rootNavigationController: BaseNavigationController { get set }
    
    // Present screen.
    func present(_ controller: UIViewController, animated: Bool)
    func present(_ controller: UIViewController, animated: Bool, completion: VoidClosure?)
    
    // Present screen on top.
    func presentOnTop(_ controller: UIViewController, animated: Bool)
    func presentOnTop(_ controller: UIViewController, animated: Bool, completion: VoidClosure?)
    
    // Dismiss screen.
    func dismiss(completion: VoidClosure?)
    func dismiss(animated: Bool, completion: VoidClosure?)
    
    func dismissTopPresentedScreen(completion: VoidClosure?)
    func dismissTopPresentedScreen(animated: Bool, completion: VoidClosure?)
    
    // Clear stack and present selected screen as root.
    func setAsRoot(_ controller: UIViewController)
    func setAsRoot(_ controller: UIViewController, animated: Bool, hideNavigationBar: Bool)
    func setAsRoot(_ controller: UIViewController, animated: Bool, hideNavigationBar: Bool, transition: CATransition?)
    
    // Uses a horizontal slide transition. Has no effect if the view screen is already in the stack.
    func push(_ controller: UIViewController)
    func push(_ controller: UIViewController, animated: Bool)
    func push(_ controller: UIViewController, animated: Bool, hideBottomBar: Bool)
    func push(_ controller: UIViewController, animated: Bool, hideBottomBar: Bool, transition: CATransition?)
    func push(_ controller: UIViewController, animated: Bool, hideNavigationBar: Bool, transition: CATransition?)
    func push(_ controller: UIViewController, animated: Bool, hideNavigationBar: Bool, hideBottomBar: Bool, transition: CATransition?)
    
    // Pops view controllers until the one specified is on top.
    func popScreen()
    func popScreen(animated: Bool)
    func popScreen(animation: CATransition)
    
    // Pops until there's only a single view controller left on the stack. Returns the popped controllers.
    func popToRootScreen(animation: CATransition?)
    func popToRootScreen(animated: Bool)
}
