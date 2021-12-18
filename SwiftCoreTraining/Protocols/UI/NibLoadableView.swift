//
//  File.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 6/1/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import UIKit
protocol NibLoadableView: AnyObject {}
extension NibLoadableView where Self: UIView {
    static func instantiateFromNib() -> Self {
        return instantiateFromNib(nibName: nil)
    }
    
    static func instantiateFromNib(nibName: String?) -> Self {
        func fromNibHelper<T>(nibName: String?) -> T where T: UIView {
            let bundle = Bundle(for: T.self)
            let name = nibName ?? String(describing: T.self)
            return bundle.loadNibNamed(name, owner: nil, options: nil)?.first as? T ?? T()
        }
        return fromNibHelper(nibName: nibName)
    }
}
