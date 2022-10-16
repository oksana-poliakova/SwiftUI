//
//  PopoverWindow.swift
//  SwiftUI_Learning
//
//  Created by Oksana on 16.10.2022.
//

import SwiftUI

struct PopoverWindow: View {
    
    @State var showNewScreen: Bool = false
    
    var body: some View {
        ZStack {
            Color.blue
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Button("Button") {
                    showNewScreen.toggle()
                }
                .font(.largeTitle)
                .foregroundColor(.white)
                .padding(.top, 30)
                
                Spacer()
            }
            
            // Method 1 - Sheet
//            .sheet(isPresented: $showNewScreen, content: {
//                NewScreen()
//            })
            
            // Method 2 - Transition
            
            ZStack {
                if showNewScreen {
                    NewScreen(showNewScreen: $showNewScreen)
                        .padding(.top, 100)
                        .transition(.move(edge: .bottom))
                        .animation(.spring())
                }
            } .zIndex(2.0)
            
            // Methon 3 - Animation offset
            
//            NewScreen(showNewScreen: $showNewScreen)
//                .padding(.top, 100)
//                .offset(y: showNewScreen ? 0 : UIScreen.main.bounds.height)
//                .animation(.spring(), value: showNewScreen)
        }
    }
}

struct NewScreen: View {
    
    // For the method of sheet
    @Environment(\.presentationMode) var presentationMode
    
    // For the method of transition
    @Binding var showNewScreen: Bool
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.yellow
                .edgesIgnoringSafeArea(.all)
            
            Button(action: {
                // For the method of sheet
//                presentationMode.wrappedValue.dismiss()
                
                // For the method of transition
                showNewScreen.toggle()
            }, label: {
                Image(systemName: "xmark")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding(20)
            })
        }
    }
}

struct PopoverWindow_Previews: PreviewProvider {
    static var previews: some View {
        PopoverWindow()
    }
}
