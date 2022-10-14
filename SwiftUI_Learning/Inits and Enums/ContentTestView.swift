//
//  ContentTestView.swift
//  SwiftUI_Learning
//
//  Created by Oksana on 14.10.2022.
//

import SwiftUI

// We will reuse this View in the GestureView

struct ContentTestView: View {
    
    enum Country: String {
        case EU
        case USA
    }
    
    private let backgroundColor: Color
    private let count: Int
    private let title: String
    private let country: Country
    
    init(backgroundColor: Color, count: Int, title: String = "Cool", country: Country) {
        self.backgroundColor = backgroundColor
        self.count = count
        self.country = country
        self.title = country.rawValue
    }
    
    var body: some View {
        VStack(spacing: 12) {
            Text("\(title)")
                .font(.largeTitle)
                .underline()
                .foregroundColor(.white)
            Text("\(count)")
                .font(.headline)
                .foregroundColor(.white)
        }
        .frame(width: 150, height: 150)
        .background(Color("CustomLightBlueColor"))
        .cornerRadius(10)
    }
}

struct ContentTestView_Previews: PreviewProvider {
    static var previews: some View {
        ContentTestView(backgroundColor: .blue, count: 0, country: .USA)
    }
}
