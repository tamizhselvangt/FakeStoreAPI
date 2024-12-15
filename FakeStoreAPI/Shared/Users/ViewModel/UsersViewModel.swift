//
//  UsersViewModel.swift
//  FakeStoreAPI
//
//  Created by Tamizhselvan gurusamy on 12/14/24.
//

import Foundation


class UsersViewModel: ObservableObject{
    @Published var  users = [User]()
    
    private let service : UserService
    
    init(service: UserService){
        self.service = service
    }
    
    @MainActor
    func fetchUsers() async{
        do{
            self.users = try await service.fetchAllUsers()
        }catch{
            print(error)
        }
    }
}
