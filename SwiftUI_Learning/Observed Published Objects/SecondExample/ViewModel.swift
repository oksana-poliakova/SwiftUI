//
//  ViewModel.swift
//  SwiftUI_Learning
//
//  Created by Oksana on 17.10.2022.
//

import SwiftUI

// MARK: - Model

struct FruitModel: Identifiable {
    let id: String = UUID().uuidString
    let name: String
    let count: Int
}

class FruitViewModel: ObservableObject {
    
    @Published var fruitArray: [FruitModel] = []
    @Published var isLoading: Bool = false
    
    init() {
        getFruits()
    }
    
    // MARK: - Functions
    
    // Get fruits
    func getFruits() {
        let fruit1 = FruitModel(name: "Apple", count: 3)
        let fruit2 = FruitModel(name: "Pineapple", count: 5)
        let fruit3 = FruitModel(name: "Blueberry", count: 50)
        
        isLoading = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            [fruit1, fruit2, fruit3].forEach {
                self.fruitArray.append($0)
                self.isLoading = false
            }
        }
    }
    
    // Delete fruits
    func deleteFruit(index: IndexSet) {
        fruitArray.remove(atOffsets: index)
    }
}

struct ViewModel: View {
    
    // MARK: - Properties
    
    @ObservedObject var fruitViewModel: FruitViewModel = FruitViewModel()
    
    // MARK: - Body
    
    var body: some View {
        NavigationView {
            List {
                if fruitViewModel.isLoading {
                    ProgressView()
                } else {
                    ForEach(fruitViewModel.fruitArray) { fruit in
                        HStack {
                            Text("\(fruit.name)")
                                .font(.headline)
                                .bold()
                            Text("\(fruit.count)")
                                .foregroundColor(.blue)
                                .bold()
                        }
                    }
                    .onDelete(perform: fruitViewModel.deleteFruit)
                }
            }
            .navigationTitle("List of Fruits")
            .navigationBarItems(trailing:
                                NavigationLink(
                                    destination: RandomScreen(fruitViewModel: fruitViewModel),
                                    label: {
                                        Image(systemName: "arrow.right")
                                        .font(.title)
            })
            )
            .onAppear() {
                fruitViewModel.getFruits()
            }
        }
    }
}

struct RandomScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var fruitViewModel: FruitViewModel
    
    var body: some View {
        ZStack {
            Color.yellow.ignoresSafeArea()
            
            VStack {
                ForEach(fruitViewModel.fruitArray) { fruit in
                    Text(fruit.name)
                        .foregroundColor(.white)
                        .font(.headline)
                }
            }
        }
    }
}

struct ViewModel_Previews: PreviewProvider {
    static var previews: some View {
        ViewModel()
    }
}
