//
//  ContextMenuTest.swift
//  SwiftUI_Learning
//
//  Created by Oksana on 14.10.2022.
//

import SwiftUI

struct ContextMenuTest: View {
    var body: some View {
        Image("switzerland")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .cornerRadius(16)
            .frame(width: 350, height: 250)
            .padding()
            .contextMenu(menuItems: {
                Button(action: {
                    
                }, label: {
                    Label("Copy", systemImage: "doc.on.doc")
                })
                
                Button(action: {
                    
                }, label: {
                    Label("Share", systemImage: "square.and.arrow.up")
                })
            })
    }
}

struct ContextMenuTest_Previews: PreviewProvider {
    static var previews: some View {
        ContextMenuTest()
    }
}
