//
//  TaskModule.swift
//  SwiftConcurrency
//
//  Created by Tamizhselvan gurusamy on 12/6/24.
//

import SwiftUI

struct TaskModule : View{
    
    @StateObject var viewModel  = AsyncAwaitViewModel()
    @State private var task : Task<(),any Error>?
    @State private var selectedUser : String?
    
    var body: some View {
        NavigationStack {
            VStack{
                List{
                    ForEach(viewModel.users){ user in
                        NavigationLink(value: user) {
                            VStack(alignment: .leading){
                                Text(user.name)
                                
                                if viewModel.isUpdateing {
                                    ProgressView()
                                } else{
                                    Text(user.email)
                                }
                            }
                        }
        // .onTapGesture {
        // selectedUser = user.name
        //}
                    }
                }
            }
            .navigationDestination(for: UserModel.self, destination: { user in
                Text("\(user.name)")
            })
        }
       
        .task(id: selectedUser) {
            print("Selected User \(selectedUser ?? "")")
        }
        .task{
            await viewModel.fetchUsers()
        }
//        .onDisappear {
//            task?.cancel()
//        }
//        .onAppear{
//            print("Task Started")
//            self.task = Task(priority: .high){
//                await viewModel.fetchUsers()
//                print("Task Completed")
//                print("Users Count \(viewModel.users.count)")
//            }
//           
//        }
    }
}


#Preview {
    TaskModule()
}
