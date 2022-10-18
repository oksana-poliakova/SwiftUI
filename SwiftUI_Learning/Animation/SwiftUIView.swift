//
//  SwiftUIView.swift
//  SwiftUI_Learning
//
//  Created by Oksana on 14.10.2022.
//

import SwiftUI

struct SwiftUIView: View {
    
    @State private var scale: CGFloat = 1
    @State private var angle: Double = 0
    @State private var rotation: Double = 0.0
    
    var body: some View {
        VStack {
            // Scale
            Button(action: {
                scale += 1
                angle += 45
            }) {
                Text("Scale effect")
                    .scaleEffect(scale)
                    .animation(.linear(duration: 0.3), value: 3)
                    .rotationEffect(.degrees(angle))
            }
            .padding()
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .buttonBorderShape(.capsule)
            
            // Interpolating spring
            Button(action: {
                angle += 15
            }) {
                Text("Interpolating spring")
                    .rotationEffect(.degrees(angle))
                    .animation(.interpolatingSpring(stiffness: 5, damping: 0.5, initialVelocity: 20))
            } .padding()
            
            // Animation delay
            Rectangle()
                .fill(Color.green)
                .frame(width: 250, height: 250)
                .rotationEffect(.degrees(rotation))
                .animation(Animation.easeInOut(duration: 3).delay(2))
                .onTapGesture {
                    self.rotation += 360
                }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
