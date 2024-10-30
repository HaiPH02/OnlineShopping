//
//  ProductView.swift
//  OnlineShopping
//
//  Created by HaiPH7.FA on 19/07/2023.
//

import SwiftUI

struct ProductView: View {
    @EnvironmentObject var vm: HomeViewModel
    let product: Product
    
    var body: some View {
        ZStack {
            VStack {
                Image(product.poster)
                    .resizable()
                    .aspectRatio(1, contentMode: .fill)

                Spacer()

                VStack(
                    alignment: .leading,
                    spacing: 0
                ) {
                    Text(product.title)
                        .fontWeight(.bold)
                        .font(.headline)
                        .foregroundColor(.primary)
                        .padding(.bottom, 5)

                    Text(product.sub)
                        .font(.footnote)
                        .fontWeight(.light)
                        .foregroundColor(.secondary)
                        .padding(.bottom, 10)

                    // MARK: - RATING VIEW
                    HStack(spacing: 5) {
                        ForEach(0 ..< product.vote, id: \.self) { _ in
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                        }
                        .padding(.bottom)
                    }

                    // MARK: - END RATING VIEW

                    HStack(spacing: 5) {

                        Spacer()

                        Text("VNĐ")
                            .font(.system(size: 13))
                            .fontWeight(.bold)

                        Text("\(product.price)")
                            .font(.system(size: 13))
                            .fontWeight(.bold)
                    }
                    .foregroundColor(.white)

                }
                .padding(.all, 12)
            }
        } // MARK: - END ZSTACK
        .backgroundColor(color: .mint)
        .cornerRadius(12)
    }
}
