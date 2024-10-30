//
//  PokemonView.swift
//  OnlineShopping
//
//  Created by HaiPH7.FA on 17/07/2023.
//

import Foundation
import SwiftUI

struct SearchProductView: View {
    @EnvironmentObject var vm: SearchProductViewModel
    let product: Product
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(product.poster)
                .resizable()
                .aspectRatio(1, contentMode: .fit)

            Text("\(product.title)")
                .font(.system(size: 16, weight: .regular, design: .monospaced))
                .padding(.bottom, 20)
                .foregroundColor(.primary)
            
        }
        .cornerRadius(4)
    }
}

