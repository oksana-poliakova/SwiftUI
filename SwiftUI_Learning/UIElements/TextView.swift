//
//  ScreenWithText.swift
//  SwiftUI_Learning
//
//  Created by Oksana on 09.10.2022.
//

import SwiftUI

struct TextView: View {
    var body: some View {
        VStack {
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore")
                .background(.orange)
                .padding(20)
                .background(.red)
                .padding(20)
                .background(.blue)
                .kerning(10)
                .font(.largeTitle)
                .foregroundColor(.white)
                .bold()
                .multilineTextAlignment(.center)
                .lineSpacing(5)
                .baselineOffset(5)
                .italic()
                .underline()
                .shadow(radius: 20)
            Spacer()
                .frame(height: 150)
            Text("Apple")
                .background(
                Circle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                )
                .padding(.bottom, 50)
                .foregroundColor(.white)
                .font(.system(size: 24, weight: .bold, design: .rounded))
                .underline()
        }
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView()
    }
}
