//
//  CartView.swift
//  OnlineShopping
//
//  Created by HaiPH7.FA on 20/07/2023.
//

import SwiftUI

struct CartView: View {
    @Binding
    var product: CartProduct
    
    var body: some View {
        HStack {
            Image(product.item.poster)
                .resizable()
                .frame(width: 150, height: 150)
                .cornerRadius(20)
            
            Spacer()
            
            VStack(
                alignment: .leading,
                spacing: 0
            ) {
                Text(product.item.title)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .padding(.bottom, 5)
                
                Text(product.item.sub)
                    .font(.footnote)
                    .fontWeight(.light)
                    .foregroundColor(.secondary)
                    .padding(.bottom, 10)
                Text("\(product.item.price  * product.quantity) VND")
                    .font(.title3)
                    .fontWeight(.bold)
                
                Spacer()
                
                HStack(alignment: .center, spacing: 12) {
                    // MARK: - MINUS BUTTON
                    Button {
                        if product.quantity > 0 {
                            product.quantity -= 1
                        }
                    } label: {
                        Image(systemName: "minus")
                            .padding(6)
                    }
                    .foregroundColor(.primary)

                    ZStack {
                        Text("\(product.quantity)")
                            .font(.body)
                            .fontWeight(.bold)
                    }
                    .padding(6)
                    .foregroundColor(.primary)
                    .background(.white)
                    .cornerRadius(4)
                    .frame(width: 100, height: 40, alignment: .center)
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(.secondary, lineWidth: 1)
                    )

                    // MARK: - PLUS BUTTON
                    Button {
                        if product.quantity < 100 {
                            product.quantity += 1
                        }
                    } label: {
                        Image(systemName: "plus")
                        .padding(6)
                    }
                    .foregroundColor(.primary)
                }
            }
        }
        .padding(.horizontal)
    }
}
