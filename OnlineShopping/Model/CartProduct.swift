//
//  CartProduct.swift
//  OnlineShopping
//
//  Created by HaiPH7.FA on 21/07/2023.
//

import Foundation

struct CartProduct: Identifiable, Codable {
    let id = UUID().uuidString
    
    var quantity: Int
    let item: Product
    
    private enum CodingKeys: String, CodingKey {
        case quantity
        case item
    }
    
    mutating func copyWith(quantity: Int?) {
        self.quantity = quantity ?? self.quantity
    }
}
