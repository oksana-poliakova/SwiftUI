//
//  ListView.swift
//  SwiftUI_Learning
//
//  Created by Oksana on 10.10.2022.
//

import SwiftUI

struct DogBreed: View {
    var dogBreed: String
    var body: some View {
        Text("Breed: \(dogBreed)")
    }
}

// MARK: - List View

struct ListView: View {
    var body: some View {
        
        VStack {
            List {
                DogBreed(dogBreed: "German shepherd")
                DogBreed(dogBreed: "Alaskan Malamute")
                DogBreed(dogBreed: "Husky")
                DogBreed(dogBreed: "Akita")
                DogBreed(dogBreed: "Beagle")
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
