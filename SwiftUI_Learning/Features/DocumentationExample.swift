//
//  DocumentationExample.swift
//  SwiftUI_Learning
//
//  Created by Oksana on 17.10.2022.
//

import SwiftUI

struct DocumentationExample: View {
    
    // MARK: - Properties
    
    @State private var data: [String] = [
        "VW", "BMW", "Toyota", "Ford"
    ]
    @State private var showAlert: Bool = false
    
    // MARK: - Body
    
    // Working copy - things to do:
     /*
      1) Fix title
      2) Fix alert
      3) Fix something else
     */
    
    var body: some View {
        NavigationView { // START: NAV
            ZStack {
                // background
                Color.blue.ignoresSafeArea()
                
                // foreground
                foregroundLayer
                .navigationTitle("Documentation")
                .navigationBarItems(trailing:
                                        Button("Alert", action: {
                    showAlert.toggle()
                })
                )
                .alert(isPresented: $showAlert, content: {
                   getAlert(text: "This is the alert!")
            })
            }
        } // END: NAV
    }
    
    /// This is a foreground layer that holds a scrollView
    private var foregroundLayer: some View {
        ScrollView { // START: SCROLLVIEW
            VStack {
                Text("Hello")
                    .padding(.bottom, 30)
                    .font(.largeTitle)
                    .bold()
                
                ForEach(data, id: \.self) { name in
                    Text(name)
                        .font(.headline)
                }
            }
        } // END: SCROLLVIEW
    }
    
    // MARK: - Functions
    
    /// Gets an alert with a specified title.
    ///
    /// This function creates and returns an alert immediately. The alert will have a title based on the text parameter but it will NOT have a message
    ///
    /// - Warning: This is no additional message in this alert. 
    /// - Parameter text: This is the title for the alert.
    /// - Returns: Returns an alert with the title.
    private func getAlert(text: String) -> Alert {
        return Alert(title: Text(text))
    }
}

struct DocumentationExample_Previews: PreviewProvider {
    static var previews: some View {
        DocumentationExample()
    }
}
