//
//  TabViewModule.swift
//  SwiftConcurrency
//
//  Created by Tamizhselvan gurusamy on 12/7/24.
//

import SwiftUI

struct TabViewModule: View {
    var body: some View {
        TabView {
            NavigationStack {
                List  {
                    NavigationLink(destination: {
                        Text("First")
                            .toolbar(.hidden,for: .tabBar)
                       
                    }, label: {
                        Text("First")
                      
                    })
                }
                .toolbar(.automatic,for: .tabBar)
       
            }
            .badge(2)
                .tabItem {
                    Image(systemName: "sun.max.fill")
                        
                        .background(Color.red)
                    
                }
                .foregroundStyle(.red)
                
            
            Text("Second")
                .tabItem {
                    Image(systemName: "moon.stars.fill")
                     
                        .background(Color.red)
                }
            
        }
  
 
    }
}

#Preview {
    TabViewModule()
}
