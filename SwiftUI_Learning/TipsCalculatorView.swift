//
//  TipsCalculatorView.swift
//  SwiftUI_Learning
//
//  Created by Oksana on 11.10.2022.
//

import SwiftUI

struct TipsCalculatorView: View {
    
    // MARK: - Properties
    
    @State private var checkAmount = ""
    @State private var numberOfPeople = 0
    @State private var tipPercentage = 0
    
    private let tipPercentages = [0, 5, 10, 15, 20]
    
    private var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    // MARK: - Body
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                    
                    Picker("Number of People", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    } .pickerStyle(.menu)
                }
                
                Section(header: Text("How much tip do you want to give?")) {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0..<tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    } .pickerStyle(.segmented)
                }
                
                Section {
                    Text("\(totalPerPerson, specifier: "%.2f")")
                }
            }
            .navigationBarTitle("Tips Calculator", displayMode: .inline)
            
        }
    }
}

struct TipsCalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        TipsCalculatorView()
    }
}
