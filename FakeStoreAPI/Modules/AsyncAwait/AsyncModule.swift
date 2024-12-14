//
//  AsyncModule.swift
//  SwiftConcurrency
//
//  Created by Tamizhselvan gurusamy on 12/5/24.
//

import SwiftUI



struct AsyncModule: View {
    
    @StateObject var viewModel = AsyncAwaitViewModel()
    
    
    var body: some View {
        VStack{
        if viewModel.isLoading{
            ProgressView()
        }else {
               if let errorMessage = viewModel.errorMessage{
                Text(errorMessage)
               }else{
                   List{
                       ForEach(viewModel.users){ user in
                           VStack(alignment: .leading){
                               Text(user.name)
                               
                               if viewModel.isUpdateing {
                                   ProgressView()
                               } else{
                                   Text(user.email)
                               }
                           }
                       }
                   }
               }
                Button (action: {
                    
                    Task{
                        await viewModel.updateUserEmails()
                    }
                    
                }, label:{
                    Text("Save")
                        .font(.title2)
                        .padding(.vertical,5)
                        .padding(.horizontal,15)
                        .background(Color.black)
                        .foregroundColor(.white)
                    
                        .clipShape(Capsule())
                })
                
            }
        }
    }
}

#Preview {
    AsyncModule()
}
