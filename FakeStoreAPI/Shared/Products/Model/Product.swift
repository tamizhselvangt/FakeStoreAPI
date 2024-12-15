//
//  Products.swift
//  FakeStoreAPI
//
//  Created by Tamizhselvan gurusamy on 12/14/24.
//

import Foundation


struct Product: Codable, Identifiable {
    let id: Int
    let title: String
    let price : Double
    let description: String
    let image: String
    
    var productOwner: User?
}


