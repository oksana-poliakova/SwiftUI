//
//  ContentView.swift
//  SwiftUI_Learning
//
//  Created by Oksana on 13.10.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var user = User(firstName: "Oksana", lastName: "Poliakova")
    
    struct User: Codable {
        var firstName: String
        var lastName: String
    }
    
    var body: some View {
        Button("Save user") {
            let encoder = JSONEncoder()
            if let data = try? encoder.encode(self.user) {
                UserDefaults.standard.set(data, forKey: "UserData")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
