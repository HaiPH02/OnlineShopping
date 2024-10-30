//
//  PokemonDetailScreen.swift
//  OnlineShopping
//
//  Created by HaiPH7.FA on 17/07/2023.
//

import Foundation
import SwiftUI

struct SearchProductDetailScreen: View {
    let product: Product
    
    var body: some View {
        VStack {
            Image(product.poster)
                .resizable()
                .aspectRatio(1, contentMode: .fill)
            
            VStack(spacing: 10) {
                Text("**Loại**: \(product.title)")
                    .font(.custom("PlayfairDisplay-Bold", size: 28))
                    .foregroundColor(Color.primary)
                Text("**Vùng**: \(product.sub)")
                    .font(.custom("PlayfairDisplay-Bold", size: 28))
                    .foregroundColor(Color.primary)
                Text("**Giá thành**: \(product.price) VND")
                    .font(.custom("PlayfairDisplay-Bold", size: 28))
                    .foregroundColor(Color.primary)
                HStack(alignment: .center) {
                    HStack(spacing: 5) {
                        ForEach(0 ..< product.vote, id: \.self) { _ in
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                        }
                        .padding(.bottom)
                    }
                }
                
            }
            .padding()
        }
    }
}
