//
//  Alerts.swift
//  SwiftUI_Learning
//
//  Created by Oksana on 12.10.2022.
//

import SwiftUI

struct Alerts: View {
    
    // MARK: - Properties
    
    @State private var showingAlert = false
    @State private var showingActionSheet = false
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            Button("Show alert") {
                showingAlert = true
            } .alert(isPresented: $showingAlert) {
                Alert(title: Text("Are you sure you want to delete this?"),
                      message: Text("There is no way back"),
                      primaryButton: .destructive(Text("Delete")) {
                        print("Deleting...")
                },    secondaryButton: .cancel())
            } .padding(.bottom, 50)
            
            Button("Show Action Sheet") {
                showingActionSheet = true
            } .actionSheet(isPresented: $showingActionSheet) {
                ActionSheet(title: Text("What do you want to do?"),
                            message: Text("There is only one choice..."),
                            buttons: [.default(Text("Dissmiss action sheet")),
                                      .cancel(),
                                      .destructive(Text("Delete"))])
            }
        }
    }
}

struct Alerts_Previews: PreviewProvider {
    static var previews: some View {
        Alerts()
    }
}
