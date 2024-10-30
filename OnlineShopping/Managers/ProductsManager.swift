//
//  ProductsManager.swift
//  OnlineShopping
//
//  Created by HaiPH7.FA on 19/07/2023.
//

import Foundation

class ProductsManager {
    func getProducts() -> [Product] {
        let data: ProductPage = Bundle.main.decode(file:"Product.json")
        let product: [Product] = data.results
        
        return product
    }
}
