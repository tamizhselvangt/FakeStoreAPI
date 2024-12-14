//
//  AsyncAwaitService.swift
//  SwiftConcurrency
//
//  Created by Tamizhselvan gurusamy on 12/5/24.
//

import Foundation

class AsyncAwaitService{
    func fetchUsers() async throws -> [UserModel] {
        
        try await Task.sleep(for: .seconds(2))
//        let throwError = Bool.random()
        let throwError = false
        if throwError{
            throw URLError(.badURL)
        }else {
            let users : [UserModel] = [
                .init(name: "Tamizhselvan", email: "tamizhselvan@gmail.com"),
                .init(name: "Nivetha", email: "nivi@gmail.com"),
                .init(name: "Jhon Doe", email: "john@gmail.com"),
                .init(name: "Angel", email: "Angel@gmail.com"),
            ]
            
            return users
        }
    }
    func fetchUsersWithCompletion(completion: @escaping([UserModel]) -> Void){
        let users : [UserModel] = [
            .init(name: "Tamizhselvan", email: "tamizhselvan@gmail.com"),
            .init(name: "Nivetha", email: "nivi@gmail.com"),
            .init(name: "Jhon Doe", email: "john@gmail.com"),
            .init(name: "Angel", email: "Angel@gmail.com"),
    ]
        
        completion(users)
    }
}
