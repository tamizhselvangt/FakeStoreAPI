//
//  AsyncLetModule.swift
//  SwiftConcurrency
//
//  Created by Tamizhselvan gurusamy on 12/8/24.
//

import SwiftUI

struct UserSats: Codable, Hashable{
    var id = UUID().uuidString
    let posts: Int
    let followers: Int
    let following: Int
}


class AsyncLetViewModel : ObservableObject{
    
    @Published var userSats : UserSats?
//
    
    init() {
        Task{
          await fetchStats()
        }
         
    }
//    
    func fetchStats() async{
      
           async  let post =  fetchPostCount()
           async  let followers = fetchFollowersCount()
           async  let following =  fetchFollowingCount()
            
        self.userSats = await UserSats(posts: post, followers: followers, following: following)
        
    }
    
    
    private func fetchPostCount() async -> Int{
          
                try? await Task.sleep(for: .seconds(1))
                return 9
            
    }
    
    private func fetchFollowersCount() async -> Int{
           
                try? await Task.sleep(for: .seconds(1))
                return 20
            
    }
 
    
    private func fetchFollowingCount() async -> Int{
           
                try? await Task.sleep(for: .seconds(1))
                return 1
            
    }
}
struct AsyncLetModule: View {
    
    @StateObject var viewModel = AsyncLetViewModel()
    var body: some View {
        HStack{

            if let stats = viewModel.userSats{
                
                VStack{
                    Text("\(stats.posts)")
                    Text("Posts")
                }
                .frame(width: 100)

                VStack{
                    Text("\(stats.following)")
                    Text("Followers")
                }
                .frame(width: 100)
     
                VStack{
                    Text("\(stats.followers)")
                    Text("Following")
                }
                .frame(width: 100)
                       
            }else{
                ProgressView()
            }
    
        }
       
    }
}

#Preview {
    AsyncLetModule()
}
