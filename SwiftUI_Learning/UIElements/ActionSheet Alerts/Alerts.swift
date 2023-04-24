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
    @State private var showingCheckErrorAlert = false
        
    // MARK: - Methods
    
    fileprivate func checkForErrorAlert() -> some View {
        return // MARK: - Check error
        Button("Check error") {
            showingCheckErrorAlert = true
        }.alert(isPresented: $showingCheckErrorAlert) {
            Alert(title: Text("Would you like to check all errors?"),
                  message: Text("You'll check all errors when you click on the button"),
                  primaryButton: .destructive(Text("Check")) {
                print("Checking...")
            }, secondaryButton: .cancel())
        } .padding(.top, 30)
    }
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            // MARK: - Show alert
            
            Button("Show alert") {
                showingAlert = true
            } .alert(isPresented: $showingAlert) {
                Alert(title: Text("Are you sure you want to delete this?"),
                      message: Text("There is no way back"),
                      primaryButton: .destructive(Text("Delete")) {
                        print("Deleting...")
                },    secondaryButton: .cancel())
            } .padding(.bottom, 30)
            
            // MARK: - Show action sheet
            
            Button("Show Action Sheet") {
                showingActionSheet = true
            } .actionSheet(isPresented: $showingActionSheet) {
                ActionSheet(title: Text("What do you want to do?"),
                            message: Text("There is only one choice..."),
                            buttons: [.default(Text("Dissmiss action sheet")),
                                      .cancel(),
                                      .destructive(Text("Delete"))])
            }
            
            checkForErrorAlert()
        }
    }
}

struct Alerts_Previews: PreviewProvider {
    static var previews: some View {
        Alerts()
    }
}
