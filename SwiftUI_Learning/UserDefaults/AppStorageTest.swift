//
//  AppStorageTest.swift
//  SwiftUI_Learning
//
//  Created by Oksana on 18.10.2022.
//

import SwiftUI

struct AppStorageTest: View {
    
    @AppStorage("name") var currentUsername: String?
    
    var body: some View {
        VStack(spacing: 20) {
            Text(currentUsername ?? "Add name here")
            
            Button("Save".uppercased()) {
                let name: String = "Sashob"
                currentUsername = name
            }
        }
    }
}

struct AppStorageTest_Previews: PreviewProvider {
    static var previews: some View {
        AppStorageTest()
    }
}
