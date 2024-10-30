//
//  CartScreen.swift
//  OnlineShopping
//
//  Created by HaiPH7.FA on 20/07/2023.
//

import SwiftUI

struct CartScreen: View {
    
    @ObservedObject var viewModel = CartViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                VStack {
                    ForEach($viewModel.cart) { product in
                        CartView(product: product)
                            .onChange(of: product.wrappedValue.quantity) { newValue in
                                if newValue == 0 {
                                    viewModel.isConfirmingDeleteItem = true
                                    viewModel.deletingItem = product.wrappedValue
                                }
                            }
                    }
                }
            }
            
            VStack(spacing: 0) {
                Divider()
                
                VStack {
                    HStack {
                        Text(String.total)
                            .font(.title3)
                            .fontWeight(.bold)
                        Spacer()
                        Text("\(viewModel.totalMoney)")
                            .font(.title3)
                            .fontWeight(.bold)
                    }
                    
                    Button {
                        // logic
                    } label: {
                        Text(String.checkout)
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 44)
                    .background(.red)
                    .foregroundColor(.white)
                    .cornerRadius(16)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(8)
            }
        }
        .alert("Are you want delete?", isPresented: $viewModel.isConfirmingDeleteItem, actions: {
            Button("Yes") {
                viewModel.delete()
                viewModel.isConfirmingDeleteItem = false
            }
            
            Button("No") {
                viewModel.restore()
                viewModel.isConfirmingDeleteItem = false
            }
        })
        .navigationTitle("Cart")
        .onAppear {
            viewModel.getTotalMoney()
        }
        .onDisappear {
            viewModel.save()
        }
    }
}
