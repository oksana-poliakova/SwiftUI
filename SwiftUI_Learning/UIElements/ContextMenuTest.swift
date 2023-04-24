//
//  ContextMenuTest.swift
//  SwiftUI_Learning
//
//  Created by Oksana on 14.10.2022.
//

import SwiftUI

struct ContextMenuTest: View {
    
    // MARK: - Properties
    
    @State private var showContextMenuToggle = false

    // MARK: - Body
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(showContextMenuToggle ? .yellow : .white)
                Text(showContextMenuToggle ? "Context menu" : "")
            }
            .animation(.spring(response: 0.3).speed(0.5), value: showContextMenuToggle)
            
            Toggle(isOn: $showContextMenuToggle) {
                Text("Show context menu")
                    .foregroundColor(.blue)
                    .bold()
            }
            .toggleStyle(SwitchToggleStyle(tint: .blue))
            .padding()
        }
    }
}

struct ContextMenuTest_Previews: PreviewProvider {
    static var previews: some View {
        ContextMenuTest()
    }
}
