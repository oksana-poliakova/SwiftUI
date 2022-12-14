//
//  CustomButton.swift
//  SwiftUI_Learning
//
//  Created by Oksana on 15.10.2022.
//

import SwiftUI

struct CustomButton: View {
    
    @State private var title = ""
    @State private var heartBackground: Color = Color.blue
    
    var body: some View {
        VStack {
            textFromSubview
            Text("\(title)")
                .padding(.bottom, 30)
            Button {
                self.title = self.title == "Button was pressed!" ? "" : "Button was pressed!"
                self.heartBackground = self.heartBackground == .red ? .blue : .red
            } label: {
                Circle()
                    .fill(Color.white)
                    .frame(width: 75, height: 75)
                    .shadow(radius: 10)
                    .overlay {
                        Image(systemName: "heart.fill")
                            .font(.largeTitle)
                            .foregroundColor(heartBackground)
                    }
            } .animation(.easeInOut, value: 5)
            
            ImageItemView()
                .padding(.top, 50)
        }
    }
    
    // Extracting from body
    
    var textFromSubview: some View {
        Text("It's subview")
            .foregroundColor(.red)
            .bold()
            .font(.largeTitle)
    }
}

// Extracting outside the body

struct ImageItemView: View {
    var body: some View {
        Image(systemName: "ladybug")
            .foregroundColor(.red)
            .font(.largeTitle)
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton()
    }
}
