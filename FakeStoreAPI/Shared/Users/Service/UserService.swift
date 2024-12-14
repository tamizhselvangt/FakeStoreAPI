//
//  UserService.swift
//  FakeStoreAPI
//
//  Created by Tamizhselvan gurusamy on 12/14/24.
//

import Foundation


struct UserService{
    
    func fetchAllUsers() async throws -> [User]{
        
        return []
    }
    
    func fetchUser(_ id:Int) async throws -> User?{
        let url = URL(string: "https://fakestoreapi.com/users/\(id)")
        
        let (data,_) = try await URLSession.shared.data(from: url!)
        
        let user = try JSONDecoder().decode(User.self, from: data)
        
        return user
    }
}
