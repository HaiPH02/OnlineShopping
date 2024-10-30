//
//  CartViewModel.swift
//  OnlineShopping
//
//  Created by HaiPH7.FA on 20/07/2023.
//

import Foundation

class CartViewModel: ObservableObject {
    @Published
    var cart: [CartProduct] = [] {
        didSet {
            self.totalMoney = cart.map { $0.quantity * $0.item.price }.reduce(0, +)
        }
    }
    
    @Published
    var isConfirmingDeleteItem: Bool = false
    
    @Published
    var totalMoney: Int = 0
    
    var deletingItem: CartProduct?
    
    init() {
        fetch()
    }
    
    func fetch() {
        self.cart = Settings.cart.value.decode()
    }
    
    func save() {
        Settings.cart.value = cart.json() ?? Settings.cart.value
    }
    
    func delete() {
        cart.removeAll(where: { $0.item.id == deletingItem?.item.id })
        deletingItem = nil
    }
    
    func getTotalMoney() {
        self.totalMoney = cart.map { $0.quantity * $0.item.price }.reduce(0, +)
    }
    
    func restore() {
        if let index = cart.firstIndex(where: { $0.item.id == deletingItem?.item.id }) {
            var item = cart[index]
            item.copyWith(quantity: 1)
            cart[index] = item
        }
    }
    
}
