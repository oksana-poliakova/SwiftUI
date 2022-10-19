//
//  ProfileView.swift
//  SwiftUI_Learning
//
//  Created by Oksana on 19.10.2022.
//

import SwiftUI

struct ProfileView: View {
    
    @AppStorage("name") var currentUsername: String?
    @AppStorage("age") var currentUserAge: Int?
    @AppStorage("gender") var currentUserGender: String?
    @AppStorage("signed_in") var currentUserSignedIn: Bool = false
    
    var body: some View {
        VStack {
            Image(systemName: "person.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
            Text(currentUsername ?? "Your name here")
            Text("Your age is \(currentUserAge ?? 0) years old")
            Text("Your gender is \(currentUserGender ?? "unknown")")
                .padding(.bottom, 30)
            
            Text("Sign out")
                .foregroundColor(.white)
                .font(.headline)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(10)
                .onTapGesture {
                    signOut()
                }
        }
        .font(.title)
        .padding()
        .padding(.vertical, 40)
        .foregroundColor(.purple)
        .background(.white)
        .cornerRadius(10)
        .shadow(radius: 10)
    }
    
    func signOut() {
        currentUsername = nil
        currentUserAge = nil
        currentUserGender = nil
        withAnimation(.spring()) {
            currentUserSignedIn = false
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
