//
//  ImagesModule.swift
//  SwiftConcurrency
//
//  Created by Tamizhselvan gurusamy on 12/7/24.
//

import Foundation
import SwiftUI


class ImageDownloader{
    private let url = URL(string: "https://picsum.photos/200")!
    
    func downloadImage() async throws -> UIImage {
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        
        guard let image = UIImage(data: data) else {
            throw URLError(.badURL)
         }
         
        return image;
    }
    
}

@MainActor
class ImageViewModel: ObservableObject {
    

    @Published var image : Image?
    private let loader = ImageDownloader()
    
    init(){
        Task{
            await downloadImage()
        }
    }
    

    
    func downloadImage() async{
        
        do{
            let uiImage = try await loader.downloadImage()
            self.image = Image(uiImage: uiImage)
        }catch{
            print("Error Accured \(error)")
        }
    }
    
}
struct ImagesModule : View {
    
    @StateObject var viewModel = ImageViewModel()
    
    private let url = URL(string: "https://picsum.photos/200")!
    var body: some View {
        VStack{
             
            if let image = viewModel.image{
                image
                    .resizable()
                    .frame(width: 200,height: 200)
                    .scaledToFill()
                    .clipShape(.rect(cornerRadius: 20))
                
            }else{
                ProgressView()
            }
            
            
            AsyncImage(url: url) {image in
                image
                    .resizable()
                    .frame(width: 200,height: 200)
                    .scaledToFill()
                    .clipShape(.rect(cornerRadius: 20))
                
            } placeholder: {
                ProgressView()
                    .frame(width: 20,height: 20)
            }
            
        }
    }
}


#Preview {
    ImagesModule()
}
