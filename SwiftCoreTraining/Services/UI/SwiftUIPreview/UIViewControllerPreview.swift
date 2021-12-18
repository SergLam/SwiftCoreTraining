//
//  UIViewControllerPreview.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 28.04.2021.
//  Copyright © 2021 Serg Liamtsev. All rights reserved.
//

import SwiftUI
import UIKit

@available(iOS 13.0, *)
struct UIViewControllerPreview: SwiftUI.View {
    
    private let factory: () -> UIViewController
    
    init(factory: @escaping () -> UIViewController) {
        self.factory = factory
    }
    
    var body: some SwiftUI.View {
        Renderer(factory)
    }
    
    private struct Renderer: UIViewControllerRepresentable {
        
        private let factory: () -> UIViewController
        
        init(_ factory: @escaping () -> UIViewController) {
            self.factory = factory
        }
        
        func makeUIViewController(context: Context) -> UIViewController {
            return factory()
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
        
    }
   
}
