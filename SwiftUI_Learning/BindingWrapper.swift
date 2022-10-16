//
//  BindingWrapper.swift
//  SwiftUI_Learning
//
//  Created by Oksana on 15.10.2022.
//

import SwiftUI

struct BindingWrapper: View {
    
    @State private var backgroundColor: Color = Color.blue
    @State private var title: String = "Title"
    
    var body: some View {
        ZStack {
            backgroundColor
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("\(title)")
                    .padding(.bottom, 30)
                    .foregroundColor(.white)
                    .font(.largeTitle)
                
                ButtonView(backgroundColor: $backgroundColor,
                           title: $title)
            }
        }
    }
}

// MARK: - Subview

struct ButtonView: View {
    
    @Binding var backgroundColor: Color
    @Binding var title: String
    @State var buttonColor: Color = Color.red
    
    var body: some View {
        Button {
            backgroundColor = Color.orange
            buttonColor = Color.blue
            title = "It's a new title"
        } label: {
            Text("Button")
                .padding()
                .background(buttonColor)
                .foregroundColor(.white)
                .font(.headline)
                .cornerRadius(8)
        }
    }
}

struct BindingWrapper_Previews: PreviewProvider {
    static var previews: some View {
        BindingWrapper()
    }
}
