//
//  States .swift
//  SwiftUI_Learning
//
//  Created by Oksana on 09.10.2022.
//

import SwiftUI

struct ToggleSliderButtonView: View {
    
    @State private var showHello = true
    @State private var showDetails = false
    @State private var password = ""
    @State private var celsius: Double = 0
    
    var body: some View {
        VStack {
            // Toogle
            Toggle(isOn: $showHello) {
                Text("Show Hello")
                    .foregroundColor(.blue)
                    .bold()
            } .padding()
            
            if showHello {
                Text("Hello everyone!")
                    .foregroundColor(.red)
                    .bold()
            }
            
            // Secure text field
            SecureField("Enter your password", text: $password)
                .textFieldStyle(.roundedBorder)
                .padding()
            Text("My password is \(password)")
            
            // Slider
            let fahrenheit = (celsius * 9) / 5 + 32
            Slider(value: $celsius, in: -100...100, step: 0.1)
            Text("\(celsius) Celsius is \(fahrenheit) Fahrenheit")
            
            Spacer()
            
            // Button
            Button(action: { showDetails.toggle()
            }) {
                Text("Show Details")
            }
            .padding(.vertical, 20)
            .padding(.horizontal, 80)
            .background(.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
            .bold()
            
            if showDetails {
                Text("Details are here...")
                    .foregroundColor(.green)
                    .bold()
                
            }
        }
    }
}

struct States__Previews: PreviewProvider {
    static var previews: some View {
        ToggleSliderButtonView()
    }
}
