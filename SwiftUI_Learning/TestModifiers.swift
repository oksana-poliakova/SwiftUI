//
//  TestModifiers.swift
//  SwiftUI_Learning
//
//  Created by Oksana on 12.10.2022.
//

import SwiftUI

// MARK: = Custom modifiers

struct CustomText: View {
    var name: String
    
    var body: some View {
        Text(name)
            .font(.largeTitle)
            .padding()
            .foregroundColor(.white)
            .background(.blue)
            .fontWeight(.bold)
    }
}

struct CustomModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .padding()
            .foregroundColor(.white)
            .background(.green)
            .fontWeight(.bold)
    }
}

// MARK: - Extensions

extension View {
    func callCustomModifier() -> some View {
        self.modifier(CustomModifier())
    }
}

struct TestModifiers: View {
    
    // MARK: - Properties
    
    @State private var useGreenText = false
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            CustomText(name: "First text")
            CustomText(name: "Second text")
            
            // Using custom modifier
            Text("Text with custom modifier")
                .modifier(CustomModifier())
            
            // Using extensions
            Text("Text styles using extensions")
                .callCustomModifier()
            
            Button("Hello World!") {
                useGreenText.toggle()
                // Conditional modifiers
            }   .foregroundColor(useGreenText ? .green : .blue)
                .padding(.top, 30)
        }
    }
}

struct TestModifiers_Previews: PreviewProvider {
    static var previews: some View {
        TestModifiers()
    }
}
