//
//  NavigationLinkTest.swift
//  SwiftUI_Learning
//
//  Created by Oksana on 12.10.2022.
//

import SwiftUI

// MARK: - Properties

struct Dog: Identifiable {
    var id = UUID()
    var name: String
}

struct DogRaw: View {
    var dog: Dog
    
    var body: some View {
        Text(dog.name)
    }
}

struct DogView: View {
    var dog: Dog
    
    var body: some View {
        Text("Come and choose a \(dog.name)")
            .font(.largeTitle)
    }
}

// MARK: - View

struct NavigationLinkTest: View {
    var body: some View {
        let first = Dog(name: "German shephard")
        let second = Dog(name: "Husky")
        let third = Dog(name: "Jack Russell Terrier")
        let dogs = [first, second, third]
        
        return NavigationView {
            List(dogs) { dog in
                NavigationLink(destination: DogView(dog: dog)) {
                    DogRaw(dog: dog)
                }
            } .navigationTitle("Choose a dog")
        }
    }
}

struct NavigationLinkTest_Previews: PreviewProvider {
    static var previews: some View {
        NavigationLinkTest()
    }
}
