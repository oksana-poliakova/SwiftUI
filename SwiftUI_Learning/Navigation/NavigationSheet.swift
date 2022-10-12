//
//  NavigationSheet.swift
//  SwiftUI_Learning
//
//  Created by Oksana on 12.10.2022.
//

import SwiftUI

struct DetailedView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Text("It's a detailed view")
            Button("Back") {
                presentationMode.wrappedValue.dismiss()
            } .padding(.top, 30)
        }
    }
}

struct NavigationSheet: View {
    
    @State private var showDetail = false
    
    var body: some View {
        Button(action: {
            showDetail.toggle()
        }) {
            Text("Show details")
        } .sheet(isPresented: $showDetail) {
            DetailedView()
        }
    }
}

struct NavigationSheet_Previews: PreviewProvider {
    static var previews: some View {
        NavigationSheet()
    }
}
