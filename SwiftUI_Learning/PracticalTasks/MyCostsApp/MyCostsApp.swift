//
//  MyCostsApp.swift
//  SwiftUI_Learning
//
//  Created by Oksana on 13.10.2022.
//

import SwiftUI

struct ExpenseItem: Identifiable, Codable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Int
}

class Expenses: ObservableObject {
    // Send data, rewrite
    @Published var items = [ExpenseItem]() {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    // Parse data
    init() {
        if let items = UserDefaults.standard.data(forKey: "Items") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([ExpenseItem].self, from: items) {
                self.items = decoded
                return
            }
        }
    }
}

struct MyCostsApp: View {
    @State private var showingAddItem = false
    @ObservedObject var expenses = Expenses()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        Spacer()
                        Text("$\(item.amount)")
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("My costs")
            .navigationBarItems(trailing:
                Button(action: {
                    self.showingAddItem = true
            }) {
                Image(systemName: "plus")
            }) .sheet(isPresented: $showingAddItem) {
                AddView(expenses: expenses)
            }
        } 
    }
    
    // Remove Items
    func removeItems(as offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}


struct MyCostsApp_Previews: PreviewProvider {
    static var previews: some View {
        MyCostsApp()
    }
}
