//
//  NavigationView.swift
//  SwiftUI_Learning
//
//  Created by Oksana on 10.10.2022.
//

import SwiftUI

struct TestNavigationView: View {
    
    @State private var users = ["User1", "User2", "User3", "User4", "User5"]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(users, id: \.self) {
                           Text($0)
                }
                .onDelete {
                    users.remove(atOffsets: $0)
                }
                .onMove {
                    users.move(fromOffsets: $0, toOffset: $1)
                }
            }
            .navigationBarTitle("List of Users", displayMode: .inline)
            .toolbar {
                EditButton()
            }
        }
    }
}

struct TestNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        TestNavigationView()
    }
}
