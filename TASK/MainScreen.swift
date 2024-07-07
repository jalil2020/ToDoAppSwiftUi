//
//  Midterm.swift
//  TASK
//
//  Created by macbook pro on 28/06/24.
//

import SwiftUI

struct MainScreen: View {
    @State private var vm = MainViewModel()
    var body: some View {
        
        @State var selectedTab = 0
        
        let icons: [String] = [
            "heart.fill", "globe", "house.fill", "person.fill"
        ]
        
        TabView(selection:$selectedTab) {
            HomeScreen()
                .tabItem {
                Image(systemName:"house.fill")
                Text("Home ")
            }.tag(0)

        
            SettingsScreen().tabItem {
                Image(systemName:"gearshape")
                Text("Setting")
            }.tag(1)

        }
        .accentColor(secondaryColor)
        .environmentObject(vm)
        

    }
}

#Preview {
    MainScreen()
}
