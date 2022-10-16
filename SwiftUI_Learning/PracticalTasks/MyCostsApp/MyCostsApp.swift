//
//  MyCostsApp.swift
//  SwiftUI_Learning
//
//  Created by Oksana on 13.10.2022.
//

import SwiftUI

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
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
                // section with the header like collapse, expandable list
                Section(
                    header:
                        HStack {
                            Text("First section")
                            Image(systemName: "ladybug")
                        }
                        .foregroundColor(.blue)
                        .font(.headline)
                ){
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
                    .onMove(perform: moveItems)
                }
            }
            
            // Navigation title and items
            .navigationTitle("My costs")
            
            .navigationBarItems(leading: EditButton()
                .font(.headline)
            )
            .navigationBarItems(trailing:
                Button(action: {
                    self.showingAddItem = true
            }) {
                Image(systemName: "plus")
                    .font(.headline)
            }) .sheet(isPresented: $showingAddItem) {
                AddView(expenses: expenses)
            }
        }
        .accentColor(.blue)
    }
    
    // Remove items
    func removeItems(as offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
    // Move items
    
    func moveItems(indices: IndexSet, newOffset: Int) {
        expenses.items.move(fromOffsets: indices, toOffset: newOffset)
    }
}

struct MyCostsApp_Previews: PreviewProvider {
    static var previews: some View {
        MyCostsApp()
    }
}
