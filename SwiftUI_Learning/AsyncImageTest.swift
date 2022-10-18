//
//  AsyncImage.swift
//  SwiftUI_Learning
//
//  Created by Oksana on 18.10.2022.
//

import SwiftUI

struct AsyncImageTest: View {
    
    // MARK: - Propetries
    
    private let url: URL
    
    // MARK: - Init
    
    init(url: URL = URL(string: "https://picsum.photos/200") ?? URL(fileURLWithPath: "")) {
        self.url = url
    }
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            // First method
            AsyncImage(url: url, content: { returnedImage in returnedImage
                    .resizable()
                    .scaledToFit()
                    .frame(width: 350, height: 350)
                    .cornerRadius(10)
            }, placeholder: {
                ProgressView()
            })
            
            // Second method
            
            AsyncImage(url: url) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let returnedImage):
                    returnedImage
                        .resizable()
                        .scaledToFit()
                        .frame(width: 350, height: 350)
                        .cornerRadius(10)
                case .failure:
                    Image(systemName: "questionmark")
                        .font(.headline)
                default:
                    Image(systemName: "questionmark")
                        .font(.headline)
                }
            }
        }
    }
}

struct AsyncImageTest_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImageTest()
    }
}
