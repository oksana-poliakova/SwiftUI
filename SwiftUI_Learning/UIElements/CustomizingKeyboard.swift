//
//  CustomizingKeyboard.swift
//  SwiftUI_Learning
//
//  Created by Oksana on 18.10.2022.
//

import SwiftUI

struct CustomizingKeyboard: View {
    
    @State private var text: String = ""
    
    var body: some View {
        TextField("Placeholder...", text: $text)
            .padding()
            .submitLabel(.next)
    }
}

struct CustomizingKeyboard_Previews: PreviewProvider {
    static var previews: some View {
        CustomizingKeyboard()
    }
}
