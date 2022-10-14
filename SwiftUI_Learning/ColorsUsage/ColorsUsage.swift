//
//  ColorsUsage.swift
//  SwiftUI_Learning
//
//  Created by Oksana on 14.10.2022.
//

import SwiftUI

struct ColorsUsage: View {
    var body: some View {
        VStack {
            Rectangle()
                .fill(Color("CustomPinkColor"))
                .frame(width: 350, height: 250)
                .cornerRadius(16)
                .shadow(color: Color("CustomLightBlueColor").opacity(0.6), radius: 20, x: 5, y: 5)
        }
    }
}

struct ColorsUsage_Previews: PreviewProvider {
    static var previews: some View {
        ColorsUsage()
    }
}
