//
//  UIViewPreview.swift
//  SwiftCoreTraining
//
//  Created by Serg Liamthev on 28.04.2021.
//  Copyright © 2021 Serg Liamtsev. All rights reserved.
//

import SwiftUI
import UIKit

@available(iOS 13.0, *)
struct UIViewPreview: SwiftUI.View {
    
    private let factory: () -> UIView
    
    init(factory: @escaping () -> UIView) {
        self.factory = factory
    }
    
    var body: some SwiftUI.View {
        Renderer(factory)
    }
    
    private struct Renderer: UIViewRepresentable {
        
        private let factory: () -> UIView
        
        init(_ factory: @escaping () -> UIView) {
            self.factory = factory
        }
        
        func makeUIView(context: Context) -> UIView {
            return factory()
        }
        
        func updateUIView(_ uiView: UIView, context: Context) {
            
        }
        
    }
   
}
