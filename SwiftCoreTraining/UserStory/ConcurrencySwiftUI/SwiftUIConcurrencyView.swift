//
//  SwiftUIConcurrencyView.swift
//  SwiftCoreTraining
//
//  Created by Serhii Liamtsev on 7/11/23.
//  Copyright © 2023 Serg Liamtsev. All rights reserved.
//

import SwiftUI

struct SwiftUIConcurrencyView: View {
    
    private let viewModel = SwiftUIConcurrencyViewModel()
    
    @State private var responseText = ""
    
    var body: some View {
        return VStack {
            Text("Hello SwiftUI")
            Text(responseText)
        }.padding()
        .task {
            do {
                responseText = try await viewModel.loadData()
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
}
