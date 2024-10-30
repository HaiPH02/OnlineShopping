//
//  ProductDetailViewModel.swift
//  OnlineShopping
//
//  Created by HaiPH7.FA on 10/07/2023.
//

import Foundation

class ProductDetailViewModel: ObservableObject {
    
    @Published
    var didAddItemSuccess: Bool = false
    
    func addCartItem(quantity: Int, item: Product) {
        let cartJson = Settings.cart.value
        if cartJson.isEmpty {
            Settings.cart.value = [
                CartProduct(
                    quantity: quantity,
                    item: item
                )
            ].json() ?? ""
        } else {
            var cart: [CartProduct] = Settings.cart.value.decode()

            if let index = cart.firstIndex(where: { item.id == $0.item.id }) {
                var existItem = cart[index]
                existItem.copyWith(quantity: existItem.quantity + quantity)
                cart[index] = existItem
            } else {
                cart.append(
                    CartProduct(
                        quantity: quantity,
                        item: item
                    )
                )
            }
            Settings.cart.value = cart.json() ?? Settings.cart.value
        }
    }
}
