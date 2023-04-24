//
//  States .swift
//  SwiftUI_Learning
//
//  Created by Oksana on 09.10.2022.
//

import SwiftUI

struct ToggleSliderButtonView: View {
    
    // MARK: - Properties
    
    @State private var showHello = false
    @State private var showDetails = false
    @State private var password = ""
    @State private var celsius: Double = 0
    @State private var isOnToggle = false
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            VStack {
                VStack {
                    // MARK: - Toogle #1
                    
                    Toggle(isOn: $showHello) {
                        Text("Show Hello")
                            .foregroundColor(.blue)
                            .bold()
                    }
                    .toggleStyle(SwitchToggleStyle(tint: .blue))
                    .padding()
                    
                    if showHello {
                        Text("Hello everyone!")
                            .foregroundColor(.red)
                            .bold()
                    }
                    
                    // MARK: - Toggle #2
                    
                    Toggle(isOn: $isOnToggle) {
                        Text("Click button")
                            .bold()
                            .foregroundColor(.blue)
                    }
                    .toggleStyle(SwitchToggleStyle(tint: .green))
                    .padding()
                    
                    if isOnToggle {
                        Text("Button has been pressed!")
                            .foregroundColor(.red)
                            .bold()
                    }
                }
                
                // MARK: - Secure text field
                
                SecureField("Enter your password", text: $password)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                Text("My password is \(password)")
                
                // MARK: - Slider
                
                let fahrenheit = (celsius * 9) / 5 + 32
                
                Slider(
                    value: $celsius,
                    in: -100...100,
                    step: 0.1,
                    minimumValueLabel: Text("0"),
                    maximumValueLabel: Text("100"),
                    label: {
                        Text("Title")
                    })
                .padding()
            
                Text("\(celsius) Celsius is \(fahrenheit) Fahrenheit")
                
                Spacer()
                
                // MARK: - Button
                
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
}

struct ToggleSliderButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ToggleSliderButtonView()
    }
}
