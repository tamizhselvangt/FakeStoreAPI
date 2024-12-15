//
//  User.swift
//  FakeStoreAPI
//
//  Created by Tamizhselvan gurusamy on 12/14/24.
//

import Foundation



struct User: Codable, Hashable, Identifiable {
    
    var id: Int
    let username: String
    let email: String
 
}

