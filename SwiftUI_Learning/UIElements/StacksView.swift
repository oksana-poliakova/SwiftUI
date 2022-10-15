//
//  ContentView.swift
//  SwiftUI_Learning
//
//  Created by Oksana on 09.10.2022.
//

import SwiftUI

struct StacksView: View {
    
    let dataStrings: [String] = ["First", "Second", "Third"]
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            Text("Hello")
                .bold()
                .font(.largeTitle)
                .foregroundColor(.blue)
            Text("It's a SwiftUI application")
                .padding(.vertical, 10)
            Spacer()
            ZStack {
                Image("apple")
                    .foregroundColor(.blue)
                Text("Logo")
                    .font(.largeTitle)
                    .foregroundColor(.white)
            }
            Spacer()
            HStack(spacing: 50) {
                ForEach(0..<3) { index in
                    Text("Hi \(index)")
                }
            } .padding(.bottom, 30)
            HStack(spacing: 20) {
                ForEach(dataStrings.indices) { index in
                    Text("\(dataStrings[index])")
                }
            }
        }
    }
}

struct StacksView_Previews: PreviewProvider {
    static var previews: some View {
        StacksView()
    }
}
