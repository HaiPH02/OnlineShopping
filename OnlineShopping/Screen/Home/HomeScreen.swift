//
//  HomeScreen.swift
//  OnlineShopping
//
//  Created by HaiPH7.FA on 06/07/2023.
//

import SwiftUI

struct HomeScreen: View {
    // MARK: - Property
    @StateObject var homeViewModel = HomeViewModel()
    @StateObject var navigator = HomeNavigator()
    
    @EnvironmentObject var tabBarNavigator: TabBarNavigator
    
    @ViewBuilder
    private func destination(from pushable: HomeNavigator.Pushable) -> some View {
        switch pushable {
        case .cart:
            CartScreen()
        }
    }
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 150), spacing: 10)
    ]
    
    var body: some View {
        NavigationView {
            
            ScrollView {
                Text("Find The \nBest")
                    .font(.custom("PlayfairDisplay-Regular", size: 28))
                    .foregroundColor(Color.primary)
                + Text(" ShoppingNow!")
                    .font(.custom("PlayfairDisplay-Bold", size: 28))
                    .foregroundColor(Color.primary)
                
                LazyVGrid(columns: adaptiveColumns, spacing: 10) {
                    ForEach(homeViewModel.productList) { product in
                        NavigationLink(destination: ProductDetailView(product: product)
                        ) {
                            ProductView(product: product)
                        }
                    }
                }
                .padding(.horizontal, 10)
            }
            .navigationTitle("Bạn muốn ăn gì?")
            .navigationBarItems(trailing: IconButton(icon: .cart, size: CGSize(width: 30, height: 30), action: {
                tabBarNavigator.push(to: .cart)
            }))
            .navigationBarTitleDisplayMode(.large)
            .background(
                links.opacity(.leastNonzeroMagnitude)
            )
        }
        .environmentObject(homeViewModel)
    }
    
    @ViewBuilder
    private var links: some View {
        ZStack {
            NavigationLink(
                "",
                destination: destination(from: .cart),
                tag: .cart,
                selection: $navigator.pushing
            )
        }
    }
}
