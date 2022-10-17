//
//  OnAppearTest.swift
//  SwiftUI_Learning
//
//  Created by Oksana on 17.10.2022.
//

import SwiftUI

struct OnAppearTest: View {
    
    @State private var myText: String = "It's a text"
    @State private var count: Int = 0
    
    var body: some View {
        NavigationView {
            ScrollView {
                Text(myText)
                
                LazyVStack {
                    ForEach(0..<50) { _ in
                        RoundedRectangle(cornerRadius: 25)
                            .frame(height: 150)
                            .padding()
                            .onAppear() {
                                count += 1
                            }
                    }
                }
            }
            .onAppear(perform: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    myText = "It's a new text!"
                }
            })
            .navigationTitle("On Appear: \(count)")
        }
    }
}

struct OnAppearTest_Previews: PreviewProvider {
    static var previews: some View {
        OnAppearTest()
    }
}
