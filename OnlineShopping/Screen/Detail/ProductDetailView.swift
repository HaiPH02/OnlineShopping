//
//  ProductDetailTestView.swift
//  OnlineShopping
//
//  Created by HaiPH7.FA on 19/07/2023.
//

import SwiftUI

struct ProductDetailView: View {
    let product: Product
    
    @StateObject
    var viewModel = ProductDetailViewModel()
    
    @State private var counter: Int = 0
    
    var body: some View {
        VStack {
            // MARK: - CONTENT
            VStack(alignment: .center, spacing: 0) {
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading) {
                        Image(product.poster)
                            .resizable()
                            .aspectRatio(1, contentMode: .fill)

                        VStack(alignment: .leading, spacing: 10) {
                            Text(product.title)
                                .font(.title)
                                .fontWeight(.bold)

                            Text(product.sub)
                                .font(.system(size: 12))
                                .foregroundColor(.secondary)

                            // MARK: - RATING VIEW
                            if product.vote != 0 {
                                HStack(spacing: 5) {
                                    ForEach(
                                        0 ..< product.vote,
                                        id: \.self
                                    ) { _ in
                                        Image(systemName: "star.fill")
                                            .foregroundColor(.yellow)
                                    }
                                }
                            }
                            // MARK: - END RATING VIEW

                            Text("Mô tả")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(.primary)

                            Text(product.overview)
                                .font(.system(size: 16))
                                .foregroundColor(.secondary)

                            // MARK: - PRICE VIEW
                            HStack(alignment: .center, spacing: 5) {
                                Text("Giá tiền")
                                    .foregroundColor(.primary)
                                    .font(.title3)
                                    .fontWeight(.bold)
                                Spacer()

                                Text("\(product.price * counter)")
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .foregroundColor(.green)

                                Text("VND")
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .foregroundColor(.primary)
                            }
                            .padding(.top)

                            // MARK: - QUANTITY BUTTON
                            HStack(alignment: .center, spacing: 12) {

                                Text("Số lượng")
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .foregroundColor(.primary)

                                Spacer()

                                // MARK: - MINUS BUTTON
                                Button {
                                    if counter > 0 {
                                        counter -= 1
                                    }
                                } label: {
                                    Image(systemName: "minus")
                                        .padding(6)
                                }
                                .foregroundColor(.primary)

                                ZStack {
                                    Text("\(counter)")
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
                                    if counter < 100 {
                                        counter += 1
                                    }
                                } label: {
                                    Image(systemName: "plus")
                                    .padding(6)
                                }
                                .foregroundColor(.primary)
                            }
                        }
                        .padding(.all, 20)
                    }
                }

                Divider()
               // MARK: - ADD TO CART
                Button {
                    viewModel.didAddItemSuccess = true
                    viewModel.addCartItem(quantity: counter, item: product)
                    
                } label: {
                    Text("Thêm vào giỏ hàng".uppercased())
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                .padding(16)
                .background(counter == 0 ? .gray.opacity(0.5) : .blue)
                .cornerRadius(12)
                .frame(width: 260, alignment: .center)
                .contentShape(Rectangle())
                .padding(.all, 20)
            }
            .alert("Did Add Item Success", isPresented: $viewModel.didAddItemSuccess) {
                Button("OK") {
                    // logic
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

