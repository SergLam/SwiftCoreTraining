//
//  UIView+Ext.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 6/1/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import UIKit

extension UIView {
    
    static func createLinearGradient(_ colors: [UIColor],
                                     _ frame: CGRect) -> CALayer {
        let newLayer = CAGradientLayer()
        newLayer.frame = frame
        newLayer.colors = colors.map{ $0.cgColor }
        newLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        newLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        return newLayer
    }
    
    func createLinearGradient(_ colors: [UIColor]) -> CALayer {
        
        return UIView.createLinearGradient(colors, bounds)
    }
    
    func addLinearGradient(_ colors: [UIColor]) {
        layer.insertSublayer(createLinearGradient(colors), at: 0)
    }
    
    func createRainbowBackground() -> CAGradientLayer {
        let newLayer = CAGradientLayer()
        newLayer.frame = self.bounds
        let colors = [UIColor.red, UIColor.green, UIColor.blue]
        newLayer.colors = colors.map { $0.cgColor }
        newLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        newLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        return newLayer
    }
    
    func addRainbowBackground() {
        let newLayer = CAGradientLayer()
        newLayer.frame = self.bounds
        let colors = [UIColor.red, UIColor.green, UIColor.blue]
        newLayer.colors = colors.map { $0.cgColor }
        newLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        newLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        layer.insertSublayer(newLayer, at: 0)
    }
    
    func removeLayers() {
        layer.sublayers?.forEach { $0.removeFromSuperlayer() }
    }
    
    func addRainbowBorder(width: CGFloat, cornerRadius: CGFloat) {
        let gradient = CAGradientLayer()
        gradient.frame = CGRect(origin: CGPoint.zero, size: bounds.size)
        let colors = [UIColor.red, UIColor.green, UIColor.blue]
        gradient.colors = colors.map { $0.cgColor }
        gradient.startPoint = CGPoint(x: 0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1, y: 0.5)
        
        layer.cornerRadius = cornerRadius
        clipsToBounds = true
        
        let shape = CAShapeLayer()
        let path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        
        shape.lineWidth = width
        shape.path = path.cgPath
        shape.strokeColor = UIColor.black.cgColor
        shape.fillColor = UIColor.clear.cgColor
        gradient.mask = shape
        
        layer.insertSublayer(gradient, below: layer)
    }
    
    func createGradientBorder(width: CGFloat, cornerRadius: CGFloat, colors: [UIColor]) -> CALayer {
        let gradient = CAGradientLayer()
        gradient.frame = CGRect(origin: CGPoint.zero, size: bounds.size)
        gradient.colors = colors.map { $0.cgColor }
        gradient.startPoint = CGPoint(x: 0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1, y: 0.5)
        
        layer.cornerRadius = cornerRadius
        clipsToBounds = true
        
        let shape = CAShapeLayer()
        let path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        
        shape.lineWidth = width
        shape.path = path.cgPath
        shape.strokeColor = UIColor.black.cgColor
        shape.fillColor = UIColor.clear.cgColor
        gradient.mask = shape
        
        return gradient
    }
    
}
