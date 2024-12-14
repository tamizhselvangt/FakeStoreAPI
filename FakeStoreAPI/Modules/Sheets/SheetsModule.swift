//
//  SheetsModule.swift
//  SwiftConcurrency
//
//  Created by Tamizhselvan gurusamy on 12/7/24.
//

import SwiftUI

struct SheetsModule: View {
    
    @State var showSheet: Bool = false
    var body: some View {
        VStack{
            Button(action: {
                showSheet.toggle()
            },label: {
                Text("Open Shhet")
            })
        }
//        .sheet(isPresented: $showSheet) {
//            print("Dismissed")
//        } content: {
//            Text("Hi")
//        }

        .sheet(isPresented: $showSheet) {
            VStack{
                
               
                Button(action: {
                    showSheet.toggle()
                },label: {
                    Text("Close Sheet")
                })
               
                
               
            }
            .presentationDetents([.large, .medium,.height(250)])
            .presentationBackgroundInteraction(.enabled(upThrough: .height(250)))
            
        }
    }
}

#Preview {
    SheetsModule()
}
