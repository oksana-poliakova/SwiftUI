//
//  ScrollViewTest.swift
//  SwiftUI_Learning
//
//  Created by Oksana on 15.10.2022.
//

import SwiftUI

struct ScrollViewTest: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack {
                ForEach(0..<10) { index in
                    Rectangle()
                        .fill(Color("CustomLightBlueColor"))
                        .frame(width: 350, height: 350)
                }
            }
        }
    }
}

struct ScrollViewTest_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewTest()
    }
}
