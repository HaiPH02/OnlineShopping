//
//  HomeViewModel.swift
//  OnlineShopping
//
//  Created by HaiPH7.FA on 06/07/2023.
//

import Foundation
import SwiftUI

enum LoadingStatus: Equatable {
    case initial
    case inProcess
    case success
    case error(String)
}

class HomeViewModel: ObservableObject {
    
    private let productManager = ProductsManager()
    
    @Published var productList = [Product]()
    @Published var searchText = ""
    
    init() {
        self.productList = productManager.getProducts()
    }
}
