//
//  Picker+Stepper.swift
//  SwiftUI_Learning
//
//  Created by Oksana on 09.10.2022.
//

import SwiftUI

struct PickerStepperView: View {
    
    // MARK: - Properties
    
    @State private var selectedColor = 0
    @State private var age = 18
    @State private var salary = 1000
    
    private var colors = ["red", "blue", "black", "white", "green"]
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            
            // Picker
            Picker("Choose a color", selection: $selectedColor, content: {
                Text("Choose a color")
                ForEach(0..<colors.count) {
                    Text(self.colors[$0])
                }
            }).pickerStyle(.wheel)
            
            Text("Selected color is: \(colors[selectedColor])")
                .bold()
            
            Spacer()
            
            // Stepper #1
            Stepper("Enter your age", value: $age, in: 18...120)
                .padding()
            Text("Your age is \(age)")
                .bold()
            
            // Stepper #2
            Stepper("Enter your salary", onIncrement: {
                self.salary += 1000
            }, onDecrement: {
                self.salary -= 1000
            })
            .padding()
            Text("Your salary is \(salary)")
                .bold()
        }
    }
}

struct Picker_And_Stepper_View_Previews: PreviewProvider {
    static var previews: some View {
        PickerStepperView()
    }
}
