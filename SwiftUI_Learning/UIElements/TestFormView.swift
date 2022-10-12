//
//  TestFormView.swift
//  SwiftUI_Learning
//
//  Created by Oksana on 11.10.2022.
//

import SwiftUI

struct TestFormView: View {
    
    @State private var colors = ["Red", "Green", "Blue"]
    @State private var selectedColor = 0
    @State private var additionalSetting = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Colors")) {
                    Picker(selection: $selectedColor, label: Text("Choose a color")) {
                        ForEach(0..<colors.count) {
                            Text(self.colors[$0])
                        }
                    }  .pickerStyle(.inline)
                }
                
                Section(header: Text("Additional Settings")) {
                    Toggle(isOn: $additionalSetting) {
                        Text("Additional settings")
                    }
                }
                                
                Button(action: {
                    // some actions
                }) {
                    Text("Save changes")
                } .disabled(!additionalSetting)
            } .navigationTitle("Settings")
        }
    }
}

struct TestFormView_Previews: PreviewProvider {
    static var previews: some View {
        TestFormView()
    }
}
