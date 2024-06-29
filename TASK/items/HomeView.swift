//
//  HomeView.swift
//  TASK
//
//  Created by macbook pro on 28/06/24.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var selectedTab:Int
    
    var body: some View {
        ZStack{
            Color.red.edgesIgnoringSafeArea(.top)
            VStack{
                Text("Home").font(.headline)
                
                Button(action: {
                    selectedTab = 2
                }, label: {
                    Text("Go profile")
                        .padding()
                        .background(Color.white)
                        .cornerRadius(12)
                })
                
                
            }
            
        }
    }
}
