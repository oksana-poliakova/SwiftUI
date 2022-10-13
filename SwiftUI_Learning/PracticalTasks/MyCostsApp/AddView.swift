//
//  AddView.swift
//  SwiftUI_Learning
//
//  Created by Oksana on 13.10.2022.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = ""
    
    @ObservedObject var expenses: Expenses
    
    let types = ["Personal", "Bussiness"]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                Picker("Type", selection: $type) {
                    ForEach(self.types, id: \.self) {
                        Text($0)
                    }
                } .pickerStyle(.inline)
                
                TextField("Amount", text: $amount)
                    .keyboardType(.numberPad)
            } .navigationTitle("Add an item")
                .navigationBarItems(trailing: Button("Save") {
                    if let actualAmount = Int(amount) {
                        let item = ExpenseItem(name: self.name, type: self.type, amount: actualAmount)
                        expenses.items.append(item)
                        self.presentationMode.wrappedValue.dismiss()
                    }
                })
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
