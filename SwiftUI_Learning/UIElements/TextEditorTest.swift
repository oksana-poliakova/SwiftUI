//
//  TextEditorTest.swift
//  SwiftUI_Learning
//
//  Created by Oksana on 16.10.2022.
//

import SwiftUI

struct TextEditorTest: View {
    
    @State var textEditorText: String = "This is the starting text."
    @State var savedText: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextEditor(text: $textEditorText)
                    .cornerRadius(8)
                    .frame(height: 250)
                    .foregroundColor(.black)
                Button(action: {
                    savedText = textEditorText
                }, label: {
                    Text("Save".uppercased())
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.blue)
                        .cornerRadius(8)
                })
                .padding(15)
                Text(savedText)
                Spacer()
            }
            .padding()
            .background(.green)
            .navigationTitle("Text editor")
            
        }
    }
}

struct TextEditorTest_Previews: PreviewProvider {
    static var previews: some View {
        TextEditorTest()
    }
}
