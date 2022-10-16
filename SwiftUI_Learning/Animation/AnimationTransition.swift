//
//  AnimationTransition.swift
//  SwiftUI_Learning
//
//  Created by Oksana on 16.10.2022.
//

import SwiftUI

struct AnimationTransition: View {
    
    @State var showView: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                Button("Show") {
                    showView.toggle()
                }
                Spacer()
            }
            
            if showView {
                RoundedRectangle(cornerRadius: 30)
                    .frame(height: UIScreen.main.bounds.height * 0.5)
//                    .transition(.slide)
//                    .transition(.move(edge: .bottom))
//                    .transition(AnyTransition.opacity.animation(.easeInOut))
                    .transition(.asymmetric(
                        insertion: .move(edge: .leading),
                        removal: .move(edge: .bottom)))
                    .animation(.easeInOut)
            }
            
        } .edgesIgnoringSafeArea(.bottom)
        
        
    }
}

struct AnimationTransition_Previews: PreviewProvider {
    static var previews: some View {
        AnimationTransition()
    }
}
