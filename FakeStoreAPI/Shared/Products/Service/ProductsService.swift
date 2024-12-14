//
//  ProductsService.swift
//  FakeStoreAPI
//
//  Created by Tamizhselvan gurusamy on 12/14/24.
//

import Foundation


struct ProductsService{
    
    private var baseURL: String {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "fakestoreapi.com"
        components.path = "/products"
        
        return components.url?.absoluteString ?? ""
    }
    
    func fetchProducts() async throws -> [Product]{
        var results = [Product]()
        
        for i in 1...5 {
            let url = URL(string: "https://fakestoreapi.com/products/\(i)")!
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let product = try JSONDecoder().decode(Product.self, from: data)
            results.append(product)
        }
        
        return results;
    }
}


//https://fakestoreapi.com/products
