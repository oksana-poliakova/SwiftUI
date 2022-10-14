//
//  GestureView.swift
//  SwiftUI_Learning
//
//  Created by Oksana on 10.10.2022.
//

import SwiftUI

struct GestureView: View {
    var body: some View {
        
        // All area can be tapped (between elements too)
        VStack {
            Text("Text1")
                .onTapGesture {
                    print("One tap")
                }
            
            ContentTestView(backgroundColor: .green, count: 20, title: "Peaches", country: .USA)
            
            Image(systemName: "pawprint")
                .foregroundColor(.brown)
                .font(.largeTitle)
                .padding(.top, 100)
                .gesture(
                    LongPressGesture(minimumDuration: 2.0)
                        .onEnded { _ in
                            print("Pressed")
                        }
                )
                .gesture(
                    DragGesture(minimumDistance: 50)
                        .onEnded { _ in
                            print("It was dragged")
                        }
                )
            
            Spacer()
            
            Text("Text2")
        } .contentShape(Rectangle())
            .onTapGesture(count: 2) {
                print("All area can be tapped")
            }
    }
}

struct GestureView_Previews: PreviewProvider {
    static var previews: some View {
        GestureView()
    }
}
