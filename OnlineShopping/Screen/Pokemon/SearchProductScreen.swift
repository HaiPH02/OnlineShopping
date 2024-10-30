//
//  PokemonScreen.swift
//  OnlineShopping
//
//  Created by HaiPH7.FA on 17/07/2023.
//

import Foundation
import SwiftUI

struct SearchProductScreen: View {
    @StateObject var vm = SearchProductViewModel()
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 150), spacing: 10)
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: adaptiveColumns, spacing: 10) {
                    ForEach(vm.filteredProduct) { product in
                        NavigationLink(destination: SearchProductDetailScreen(product: product)
                        ) {
                            SearchProductView(product: product)
                        }
                    }
                }
                .animation(.easeInOut(duration: 0.3), value: vm.filteredProduct.count)
                .padding(.horizontal, 10)
            }
            .navigationBarTitleDisplayMode(.large)
            .navigationTitle(String.searchProduct)
            .searchable(text: $vm.searchText)
        }
        .environmentObject(vm)
    }
}
