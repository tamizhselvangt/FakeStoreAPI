//
//  TaskGroupModule.swift
//  FakeStoreAPI
//
//  Created by Tamizhselvan gurusamy on 12/15/24.
//

import SwiftUI

import SwiftUI

struct TaskGroupModule: View {
    
    @StateObject var productsViewModel = ProductsViewModel(service: ProductsService())
    
    @StateObject var usersViewModel = UsersViewModel(service: UserService())
    var body: some View {
        List{
            Section("Products"){
                ForEach(productsViewModel.products){
                    product in
                    HStack(spacing: 16) {
                        Text("\(product.id)")
                        
                        VStack(alignment: .leading){
                            Text(product.title)
                                .lineLimit(1)
                            
                            Text("$\(product.price)")
                                .foregroundStyle(.gray)
                                .font(.footnote)
                        }
                    }
                }
            }
            Section("Users"){
                ForEach(usersViewModel.users){ user in
                    Text("\(user.username)")
                        .font(.headline)
                }
            }
        }
        .task {
            await usersViewModel.fetchUsers()
        }
        .task {
            await productsViewModel.fetchProducts()
        }
        
        
    }
}

#Preview {
    TaskGroupModule()
}
