//
//  LazyGrids.swift
//  SwiftUI_Learning
//
//  Created by Oksana on 15.10.2022.
//

import SwiftUI

struct LazyGrids: View {
    
    private let columns: [GridItem] = [
        GridItem(.flexible(), spacing: nil, alignment: nil),
        GridItem(.flexible(), spacing: nil, alignment: nil),
        GridItem(.flexible(), spacing: nil, alignment: nil)
    ]
    
    private let rows: [GridItem] = [
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView(.vertical) {
            ScrollView(.horizontal) {
                LazyHGrid(rows: rows) {
                    ForEach(0..<10) { index in
                        Rectangle()
                            .fill(Color.blue)
                            .frame(width: 50, height: 150)
                    }
                }
            }
            
            LazyVGrid(
                columns: columns,
                pinnedViews: .sectionHeaders) {
                Section(header:
                            Text("Section with vertical scroll")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .background(Color.green)
                    .font(.headline)
                    .foregroundColor(.white)
                ){
                    ForEach(0..<50) { index in
                        Rectangle()
                            .fill(Color.blue)
                            .frame(height: 150)
                    }
                }
                Section(header:
                            Text("Section 2 with vertical scroll")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .background(Color.green)
                    .font(.headline)
                    .foregroundColor(.white)
                ){
                    ForEach(0..<50) { index in
                        Rectangle()
                            .fill(Color.blue)
                            .frame(height: 150)
                    }
                }
            }
        }
    }
}

struct LazyGrids_Previews: PreviewProvider {
    static var previews: some View {
        LazyGrids()
    }
}
