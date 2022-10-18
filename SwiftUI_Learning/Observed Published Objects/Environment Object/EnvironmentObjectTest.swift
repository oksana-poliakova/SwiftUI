//
//  EnvironmentObjectTest.swift
//  SwiftUI_Learning
//
//  Created by Oksana on 18.10.2022.
//

import SwiftUI

// MARK: - EnvironmentViewModel

class EnvironmentViewModel: ObservableObject {
    
    @Published var dataArray: [String] = []
    
    init() {
        getData()
    }
    
    func getData() {
        self.dataArray.append(contentsOf: ["iPhone", "iPad", "iMac", "Apple Watch"])
    }
}

// MARK: - EnvironmentObjectTest

struct EnvironmentObjectTest: View {
    
    @StateObject var viewModel: EnvironmentViewModel = EnvironmentViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.dataArray, id: \.self) { item in
                    NavigationLink(destination: DetailView(selectedItem: item), label: {
                        Text(item)
                    })
                }
            }
            .navigationTitle("Apple Devices")
            // all subviews get access to this viewModel
        } .environmentObject(viewModel)
    }
}

// MARK: - DetailView

struct DetailView: View {
    
    let selectedItem: String
    // if use EnvironmentObject it doesn't need a reference to the viewModel
    
//    @ObservedObject var viewModel: EnvironmentViewModel
    
    var body: some View {
        ZStack {
            Color.yellow.ignoresSafeArea()
            
            NavigationLink(destination: FinalView(), label: {
                Text(selectedItem)
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal)
                    .background(.blue)
                    .cornerRadius(30)
            })
        }
    }
}

// MARK: - FinalView

struct FinalView: View {
    
    @EnvironmentObject var viewModel: EnvironmentViewModel
    
    var body: some View {
        ZStack {
            // background
            LinearGradient(
                colors: [.indigo, .blue, .purple],
                startPoint: .topLeading,
                endPoint: .bottomTrailing)
            .ignoresSafeArea()
            
            // foreground
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(viewModel.dataArray, id: \.self) { item in
                        Text(item)
                    }
                }
                .foregroundColor(.white)
                .font(.headline)
            }
        }
    }
}

struct EnvironmentObjectTest_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentObjectTest()
    }
}
