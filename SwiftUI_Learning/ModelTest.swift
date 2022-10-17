//
//  ModelTest.swift
//  SwiftUI_Learning
//
//  Created by Oksana on 17.10.2022.
//

import SwiftUI

struct UserModel: Identifiable {
    var id: String = UUID().uuidString
    let displayName: String
    let userName: String
    let followersCount: Int
    let isVerified: Bool
}

struct ModelTest: View {
    
    @State var users: [UserModel] = [
        UserModel(displayName: "Oksana", userName: "iOS dev", followersCount: 200, isVerified: true),
        UserModel(displayName: "Alex", userName: "Senior iOS", followersCount: 250, isVerified: false),
        UserModel(displayName: "Maria", userName: "mari_princess", followersCount: 12, isVerified: true)
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(users) { user in
                    HStack {
                        Circle()
                            .frame(width: 35, height: 35)
                        VStack {
                            Text(user.displayName)
                                .font(.headline)
                            Text("@\(user.userName)")
                                .foregroundColor(.gray)
                                .font(.caption)
                        }
                        Spacer()
                        
                        if user.isVerified {
                            Image(systemName: "checkmark.seal.fill")
                                .foregroundColor(.blue)
                        }
                        
                        VStack {
                            Text("\(user.followersCount)")
                                .font(.headline)
                            Text("Followers")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                            .padding(.vertical, 15)
                    }
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Users")
        }
    }
}

struct ModelTest_Previews: PreviewProvider {
    static var previews: some View {
        ModelTest()
    }
}
