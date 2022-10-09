//
//  ScreenWithImageAndButton.swift
//  SwiftUI_Learning
//
//  Created by Oksana on 09.10.2022.
//

import SwiftUI

struct ImagesGradientsView: View {
    
    // MARK: - Body
    
    var body: some View {
        let colors = Gradient(colors: [.red, .yellow, .green, .blue, .purple])
        let gradient = RadialGradient(gradient: colors, center: .center, startRadius: 50, endRadius: 200)
        VStack {
            Image("mountain")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(Capsule())
            Spacer()
            Circle()
                .fill(gradient)
                .frame(width: 400, height: 400)
            Spacer()
            Image(systemName: "sun.max.fill")
                .padding(.vertical, 30)
                .padding(.horizontal, 150)
                .font(.largeTitle)
                .bold()
                .background(.blue)
                .foregroundColor(.yellow)
                .clipShape(RoundedRectangle(cornerRadius: 20))
        }
    }
}

struct ScreenWithImageAndButton_Previews: PreviewProvider {
    static var previews: some View {
        ImagesGradientsView()
    }
}
