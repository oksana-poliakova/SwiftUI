//
//  ColorPickerTest.swift
//  SwiftUI_Learning
//
//  Created by Oksana on 16.10.2022.
//

import SwiftUI

struct ColorPickerTest: View {
    
    @State private var backgroundColor: Color = .blue
    
    var body: some View {
        ZStack {
            backgroundColor
                .edgesIgnoringSafeArea(.all)
            
            ColorPicker("Choose a color",
                        selection: $backgroundColor,
                        supportsOpacity: true)
            .padding()
            .background(.white)
            .cornerRadius(8)
            .padding(50)
            .font(.headline)
            
        }
    }
}

struct ColorPickerTest_Previews: PreviewProvider {
    static var previews: some View {
        ColorPickerTest()
    }
}
