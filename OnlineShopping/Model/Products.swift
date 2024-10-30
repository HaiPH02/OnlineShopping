//
//  Products.swift
//  OnlineShopping
//
//  Created by HaiPH7.FA on 06/07/2023.
//

import Foundation

struct ProductPage: Codable { 
    let page: Int
    let results: [Product]
}

struct Product: Codable, Identifiable, Equatable, Hashable {
    let id: Int
    let title: String
    let sub: String
    let poster: String
    let overview: String
    let vote: Int
    let price: Int
}

