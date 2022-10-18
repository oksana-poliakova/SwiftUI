//
//  DarkMode.swift
//  SwiftUI_Learning
//
//  Created by Oksana on 17.10.2022.
//

import SwiftUI

struct DarkMode: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    Text("This color is primary")
                        .padding(.top, 30)
                        .foregroundColor(.primary)
                    Text("This color is secondary")
                        .foregroundColor(.secondary)
                    Text("This color is white")
                        .foregroundColor(.white)
                    Text("This color is black")
                        .foregroundColor(.black)
                    Text("This color is globally adaptive")
                        .foregroundColor(Color("AdaptiveColor"))
                    Text("This color is locally adaptive")
                        .foregroundColor(colorScheme == .light ? .blue : .red)
                }
            }
            .navigationTitle("Dark mode")
        }
    }
}

struct DarkMode_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DarkMode()
                .preferredColorScheme(.light)
            DarkMode()
                .preferredColorScheme(.dark)
        }
    }
}
