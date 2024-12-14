//
//  Products.swift
//  FakeStoreAPI
//
//  Created by Tamizhselvan gurusamy on 12/14/24.
//

import Foundation


struct Product: Codable {
    let id: Int
    let title: String
    let price : Double
    let description: String
    let category: String
    let image: String
    let rating: Rating
}


struct Rating: Codable {
    let rate: Double
    let count: Int
}

