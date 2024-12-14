//
//  NavigationModule.swift
//  SwiftConcurrency
//
//  Created by Tamizhselvan gurusamy on 12/7/24.
//

import SwiftUI

struct NavigationModule: View {
    
    
    
    var drivers = [
        "John Doe",
        "Jane Doe",
        "John Smith",
        "John Johnson",
        "Elon Musk",
        
        "Json Paul",
        "Samual Jacson",
    ]
    
    var teams = [1...10]
    var body: some View {
        NavigationStack{
                List{
                    Section{
                        ForEach(drivers,id: \.self){ driver in
                            NavigationLink{
                                Text(driver)
                            } label:{
                                Text(driver)
                            }
                            
                         
                        }
                    }
                    
                    
                    Section(header: Text("Navigation")){
                        ForEach(drivers, id:\.self){ driver in
                            NavigationLink(value: driver) {
                                Text(driver)
                            }
                        }
                    }
                }
                .navigationDestination(for: String.self, destination: { driver
                    in
                    Text(driver)
                })
            .navigationTitle("Navigation")
        }
    }
}

#Preview {
    NavigationModule()
}
