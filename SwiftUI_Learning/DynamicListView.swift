//
//  DynamicListView.swift
//  SwiftUI_Learning
//
//  Created by Oksana on 10.10.2022.
//

import SwiftUI

struct CatBreed: Identifiable {
    var id = UUID() // required
    var catBreedTitle: String
}

struct CatRaw: View {
    var catBreed: CatBreed
    var body: some View {
        Text("Breed: \(catBreed.catBreedTitle)")
    }
}

// MARK: - List View

struct DynamicListView: View {
    var body: some View {
        
        let first = CatBreed(catBreedTitle: "Bengal")
        let second = CatBreed(catBreedTitle: "British Shorthair")
        let third = CatBreed(catBreedTitle: "Maine Coon")
        let catBreeds = [first, second, third]
        
        return List(catBreeds) { breed in
            CatRaw(catBreed: breed)
        }
    }
}

struct DynamicListView_Previews: PreviewProvider {
    static var previews: some View {
        DynamicListView()
    }
}
