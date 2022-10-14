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
            .contextMenu {
                VStack {
                    Button(action: {
                        print("Copy")
                    }) {
                        HStack {
                            Image(systemName: "doc.on.doc")
                            Text("Copy")
                        }
                    }
                    
                    Button(action: {
                        print("Share")
                    }) {
                        HStack {
                            Image(systemName: "square.and.arrow.up")
                            Text("Share")
                        }
                    }
                }
            }
    }
}

struct ContextMenuTest_Previews: PreviewProvider {
    static var previews: some View {
        ContextMenuTest()
    }
}
