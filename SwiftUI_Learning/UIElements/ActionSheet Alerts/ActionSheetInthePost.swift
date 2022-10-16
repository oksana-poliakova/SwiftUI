//
//  ActionSheetInthePost.swift
//  SwiftUI_Learning
//
//  Created by Oksana on 16.10.2022.
//

// Reusable ActionSheet in posts like Instagram

import SwiftUI

struct ActionSheetInthePost: View {
    
    enum ActionSheetOptions {
        case isMyPost
        case isOtherPost
    }
    
    @State private var showActionSheet: Bool = false
    @State private var actionSheetOption: ActionSheetOptions = .isMyPost

    var body: some View {
        VStack {
            HStack {
                Circle()
                    .frame(width: 30, height: 30)
                Text("@username")
                Spacer()
                
                Button(action: {
                    actionSheetOption = .isMyPost
                    showActionSheet.toggle()
                }, label: {
                    Image(systemName: "ellipsis")
                })
                .accentColor(.primary)
            }
            .padding(.horizontal)
            
            Rectangle()
                .aspectRatio(contentMode: .fit)
        } .actionSheet(isPresented: $showActionSheet, content: getActionSheet)
    }
    
    private func getActionSheet() -> ActionSheet {
        let shareButton: ActionSheet.Button = .default(Text("Share")) {
            // add code to share post
        }
        
        let reportButton: ActionSheet.Button = .destructive(Text("Report")) {
            // add code to report post
        }
        
        let deleteButton: ActionSheet.Button = .destructive(Text("Delete")) {
            // add code to report post
        }
        
        let cancelButton: ActionSheet.Button = .cancel()
        let title = Text("What would you like to do?")
        
        switch actionSheetOption {
        case .isOtherPost:
            return ActionSheet(
                title: title,
                message: nil,
                buttons: [shareButton, reportButton, cancelButton])
        case .isMyPost:
            return  ActionSheet(
                title: title,
                message: nil,
                buttons: [shareButton, reportButton, deleteButton, cancelButton])
        }
    }
}

struct ActionSheetInthePost_Previews: PreviewProvider {
    static var previews: some View {
        ActionSheetInthePost()
    }
}
