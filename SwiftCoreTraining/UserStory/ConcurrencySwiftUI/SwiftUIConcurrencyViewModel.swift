//
//  SwiftUIConcurrencyViewModel.swift
//  SwiftCoreTraining
//
//  Created by Serhii Liamtsev on 7/11/23.
//  Copyright © 2023 Serg Liamtsev. All rights reserved.
//

import Combine

final class SwiftUIConcurrencyViewModel: ObservableObject {
    
    private let decoder = JSONDecoder()
    
    func loadData() async throws -> String {
        guard let url = URL(string: "https://dummyjson.com/products/1") else {
            throw NSError(domain: Environment.bundleId, code: 1001, userInfo: ["error": "invalid url"])
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        return data.prettyPrintedJSONString ?? ""
    }
}
