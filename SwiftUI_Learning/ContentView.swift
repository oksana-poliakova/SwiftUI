//
//  ContentView.swift
//  SwiftUI_Learning
//
//  Created by Oksana on 09.10.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello")
                .bold()
                .font(.largeTitle)
                .foregroundColor(.blue)
            Text("It's a SwiftUI application")
                .padding(.vertical, 10)
            ZStack {
                Image("apple")
                    .foregroundColor(.blue)
                Text("Logo")
                    .font(.largeTitle)
                    .foregroundColor(.white)
            }
            HStack(spacing: 50) {
                Text("Text 1")
                Text("Text 2")
                Text("Text 3")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
