//
//  File.swift
//  SwiftConcurrency
//
//  Created by Tamizhselvan gurusamy on 12/5/24.
//

import Foundation


struct UserModel: Identifiable, Hashable{
    var id = UUID().uuidString
    
    let name: String
    let email : String
}
