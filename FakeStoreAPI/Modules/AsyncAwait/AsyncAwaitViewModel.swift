//
//  AsyncAwaitViewModel.swift
//  SwiftConcurrency
//
//  Created by Tamizhselvan gurusamy on 12/5/24.
//

import Foundation



@MainActor
class AsyncAwaitViewModel: ObservableObject{
    
    @Published var users = [UserModel]()
    @Published var isLoading: Bool = false
    @Published var isUpdateing :Bool = false
    @Published var errorMessage: String?
    
    private let service: AsyncAwaitService = AsyncAwaitService()
    
    init()  {
        Task{await fetchUsers()}
    }
    
    func fetchUsers() async {
        isLoading = true
        
        defer{
            isLoading = false
        }
        do{
            print("Function Call Started")
            self.users = try await service.fetchUsers()
        }catch{
            self.errorMessage = "Failed to fetch users \(error)"
            print("Failed to fetch users \(error)")
        }

    }
    
    func updateUserEmails() async {
        
        isUpdateing = true
        try? await Task.sleep(for: .seconds(1))
        
        var newUsers = [UserModel]()
        
        if users.isEmpty {
            return
        }
        for user in users{
            let newEmail = user.email.replacingOccurrences(of: "@gmail.com", with: "@yahoo.com")
            
            let newUser = UserModel(name: user.name, email: newEmail)
            
            newUsers.append(newUser)
        }

        self.users =  newUsers
        isUpdateing = false
    }
    
  
}
