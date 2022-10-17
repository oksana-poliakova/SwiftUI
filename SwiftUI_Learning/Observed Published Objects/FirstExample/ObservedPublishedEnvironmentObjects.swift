//
//  ObservedPublishedEnvironmentObjects.swift
//  SwiftUI_Learning
//
//  Created by Oksana on 12.10.2022.
//

// We use @State with structs and mostly it's @State private
// We use @ObservedObject with classes, properties mark as @Published

import SwiftUI

struct ObservedPublishedEnvironmentObjects: View {
    
    // MARK: - User
    
    class User: ObservableObject {
        // When we change properties of the class -> property wrapper @published
        // Subsribing to class ObservableObject is required
        
        @Published var firstName = "Oksana"
        @Published var lastName = "Poliakova"
    }
    
    // MARK: - Properties
    
    @ObservedObject var user = User()
    @ObservedObject var settings = UserSettings()
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName)")
                .foregroundColor(.blue)
                .fontWeight(.bold)
            
            TextField("First name", text: $user.firstName)
            TextField("Last name", text: $user.lastName)
            
            Text("Your score is \(settings.score)")
            Button(action: {
                settings.score += 1
            }) {
                Text("Increase your score")
            } .padding(.top, 10)
                .fontWeight(.bold)
        } .padding()
    }
}

struct ObservedPublishedEnvironmentObjects_Previews: PreviewProvider {
    static var previews: some View {
        ObservedPublishedEnvironmentObjects()
    }
}
