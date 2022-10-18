//
//  CustomListSwipeActions.swift
//  SwiftUI_Learning
//
//  Created by Oksana on 18.10.2022.
//

import SwiftUI

struct CustomListSwipeActions: View {
    
    @State var fruits: [String] = [
        "apple", "avocado", "banana", "orange"
    ]
    
    var body: some View {
        List {
            ForEach(fruits, id: \.self) {
                Text($0.capitalized)
                    .swipeActions(edge: .trailing,
                                  allowsFullSwipe: true) {
                        Button("Archive") {
                            
                        }
                        .tint(.purple)
                    }
                    .swipeActions(edge: .leading,                       allowsFullSwipe: true) {
                        Button("Skip") {
                                          
                        }
                        .tint(.green)
                    }
            }
        }
    }
}

struct CustomListSwipeActions_Previews: PreviewProvider {
    static var previews: some View {
        CustomListSwipeActions()
    }
}
