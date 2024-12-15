//
//  ProductsService.swift
//  FakeStoreAPI
//
//  Created by Tamizhselvan gurusamy on 12/14/24.
//

import Foundation


import Foundation

struct ProductsService{
    
    enum Error: Swift.Error{
        case invalidURL
    }
    private var baseURL: String {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "fakestoreapi.com"
        components.path = "/products"
        
        return components.url?.absoluteString ?? ""
    }
    
    
    func fetchProductsByIterator() async throws -> [Product]{
        var results = [Product]()
        
        for i in 1...5 {
            let url = URL(string: "https://fakestoreapi.com/products/\(i)")!
            async let (data, _) = try URLSession.shared.data(from: url)
            let product = try await JSONDecoder().decode(Product.self, from: data)
            results.append(product)
        }
      return results
    }
    
    func fetchProductsByTaskGroup() async throws -> [Product] {
        var results = [Product]()
        
        // Use withThrowingTaskGroup to allow throwing tasks
        try await withThrowingTaskGroup(of: Product.self) { group in
            for i in 1...5 {
                group.addTask {
                    let url = URL(string: "https://fakestoreapi.com/products/\(i)")!
                    let (data, _) = try await URLSession.shared.data(from: url)
                    return try JSONDecoder().decode(Product.self, from: data)
                }
            }
            
            // Collect results from all tasks
            for try await product in group {
                results.append(product)
            }
        }
        
        return results
    }

    
    func fetchProducts() async throws -> [Product]{
        guard let url = URL(string: "https://fakestoreapi.com/products") else{
            throw Error.invalidURL
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        let products = try JSONDecoder().decode([Product].self, from: data)
        return products;
    }
}


//https://fakestoreapi.com/products
