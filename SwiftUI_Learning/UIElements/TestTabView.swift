//
//  TabView.swift
//  SwiftUI_Learning
//
//  Created by Oksana on 11.10.2022.
//

import SwiftUI

struct TestTabView: View {
    
    /// binding tab with the screen
    @State private var selectedTab: Int = 1
    
    var body: some View {
        TabView(selection: $selectedTab) {
            
            HomeView(selectedTab: $selectedTab)
                .tabItem{
                    Image(systemName: "house.fill")
                    Text("First Tab")
                } .tag(0)
            
            Text("First screen")
                .tabItem {
                    Image(systemName: "tortoise.fill")
                    Text("First Tab")
                } .tag(1)
            
            Text("Second screen")
                .tabItem {
                    Image(systemName: "ladybug.fill")
                    Text("Second Tab")
                } .tag(2)
        }
        .accentColor(.green)
    }
}

struct HomeView: View {
    
    @Binding var selectedTab: Int
    
    var body: some View {
        ZStack {
            Color.gray.ignoresSafeArea()
            VStack {
                Text("Home Tab")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                Button(action: {
                    selectedTab = 1
                }, label: {
                    Text("Go to First tab")
                        .foregroundColor(.blue)
                        .padding()
                        .background(.white)
                })
                .cornerRadius(8)
            }
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TestTabView()
    }
}


