//
//  TestView.swift
//  SwiftUI_Learning
//
//  Created by Oksana on 14.10.2022.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        ZStack {
            Image("switzerland")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .opacity(1)
                // color settings
                .colorMultiply(.gray)
                .saturation(1.2)
                .contrast(1.2)
            
            // Text Switzerland
            Text("Switzerland")
                .padding(15)
                .border(Color.white, width: 5)
                .font(.largeTitle)
                .foregroundColor(.white)
                .background(.blue)
                .bold()
                .blur(radius: 0)
                .italic()
                .cornerRadius(8)
                .offset(x: 70, y: 320)
                .rotationEffect(.degrees(10))
                .textSelection(.enabled)
            
            // Circle
            Circle()
                .strokeBorder(Color.white, lineWidth: 5)
                .frame(width: 350, height: 350)
            
            // Dash circle
            Circle()
                .strokeBorder(Color.white, style: StrokeStyle(lineWidth: 5, dash: [20, 10]))
                .frame(width: 200, height: 200)
            
            // Text 2020
            Text("2020")
                .padding()
                .shadow(color: .yellow, radius: 5, x: 2, y: 2)
                .overlay(RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.blue, lineWidth: 5)
                )
                .bold()
                .foregroundColor(.blue)
                .italic()
                .scaleEffect(1.1)
                .font(.largeTitle)
                .offset(x: 0, y: -350)
            
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
