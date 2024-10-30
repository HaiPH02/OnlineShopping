//
//  PokemonViewModel.swift
//  OnlineShopping
//
//  Created by HaiPH7.FA on 17/07/2023.
//

import Foundation
import SwiftUI

class SearchProductViewModel: ObservableObject {
    private let productManager = ProductsManager()
    
    @Published var productList = [Product]()
    @Published var searchText = ""
    
    var filteredProduct: [Product] {
                return searchText == "" ? productList : productList.filter { $0.title.contains(searchText.lowercased()) }
            }
    
    init() {
        self.productList = productManager.getProducts()
    }
    
    func getProductIndex(product: Product) -> Int {
        if let index = self.productList.firstIndex(of: product) {
            return index + 1
        }
        return 0
    }
    
    func getDetails(product: Product) {
        let id = getProductIndex(product: product)
    }
}
