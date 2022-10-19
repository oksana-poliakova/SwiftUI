//
//  FocusStateTest.swift
//  SwiftUI_Learning
//
//  Created by Oksana on 19.10.2022.
//

import SwiftUI

struct FocusStateTest: View {
    
    // MARK: - Properties
    
    enum OnboardingField: Hashable {
        case username
        case password
    }
    
    @State private var username: String = ""
    @State private var password: String = ""
    @FocusState private var fieldInFocus: OnboardingField?
    
    var body: some View {
        VStack(spacing: 30) {
            TextField("Add your name here", text: $username)
                .padding(.leading)
                .frame(height: 55)
                .frame(maxWidth: UIScreen.main.bounds.width)
                .background(Color.blue.brightness(0.3))
                .cornerRadius(10)
                .focused($fieldInFocus, equals: .username)
                .foregroundColor(.black)
            
            TextField("Add your password here", text: $password)
                .padding(.leading)
                .frame(height: 55)
                .frame(maxWidth: UIScreen.main.bounds.width)
                .background(Color.blue.brightness(0.3))
                .cornerRadius(10)
                .focused($fieldInFocus, equals: .password)
                .foregroundColor(.black)
            
            Button("Sign up") {
                let usernameIsValid = !username.isEmpty
                let passwordIsValid = !password.isEmpty
                
                if usernameIsValid && passwordIsValid {
                    print("Sign up")
                } else if usernameIsValid {
                    fieldInFocus = .password
                } else {
                    fieldInFocus = .username
                }
            }
        }
        .padding(40)
    }
}

struct FocusStateTest_Previews: PreviewProvider {
    static var previews: some View {
        FocusStateTest()
    }
}
