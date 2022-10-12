//
//  TabView.swift
//  SwiftUI_Learning
//
//  Created by Oksana on 11.10.2022.
//

import SwiftUI

struct TestTabView: View {
    
    /// binding tab with the screen
    @State private var selectedView = 1
    
    var body: some View {
        TabView(selection: $selectedView) {
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
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TestTabView()
    }
}
