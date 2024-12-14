//
//  ProductsViewModel.swift
//  FakeStoreAPI
//
//  Created by Tamizhselvan gurusamy on 12/14/24.
//

import Foundation


class ProductsViewModel: ObservableObject{
    
    @Published var products = [Product]()
    
    private let service : ProductsService
    
    init(service: ProductsService){
        self.service = service
    }
    
    @MainActor
    func fetchProducts() async{
        do{
            products = try await service.fetchProducts()
        }catch{
            print(error)
        }
    }
    
}
