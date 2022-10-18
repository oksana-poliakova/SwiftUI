//
//  BackgroundsTest.swift
//  SwiftUI_Learning
//
//  Created by Oksana on 18.10.2022.
//

import SwiftUI

struct BackgroundsTest: View {
    var body: some View {
        VStack {
            Spacer()
            
            VStack {
               RoundedRectangle(cornerRadius: 4)
                    .frame(width: 50, height: 4)
                    .padding()
                Spacer()
            }
            .frame(height: 350)
            .frame(maxWidth: .infinity)
            .background(.ultraThinMaterial)
            .cornerRadius(30)
        }
        .ignoresSafeArea(.all)
        .background(
            Image("wallpaper")
                .renderingMode(.original)
                .resizable()
                .scaledToFill()
                .aspectRatio(contentMode: .fill)
                .frame(height: UIScreen.main.bounds.height)
        )
    }
}

struct BackgroundsTest_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundsTest()
    }
}
