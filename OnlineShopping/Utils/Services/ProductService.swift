//
//  ProductService.swift
//  OnlineShopping
//
//  Created by HaiPH7.FA on 11/07/2023.
//

import Foundation

protocol ProductServiceProtocol {
    func register(email: String, password: String, firstName: String?, lastName: String?, completion: @escaping (Result<UserModel, NetworkError>) -> Void)
    func login(email: String, password: String, completion: @escaping(Result<UserModel, NetworkError>) -> Void)
}

class ProductService: ProductServiceProtocol {
    func register(email: String, password: String, firstName: String?, lastName: String?, completion: @escaping (Result<UserModel, NetworkError>) -> Void) {
        HTTPClient.shared.register(email: email, password: password, firstName: firstName, lastName: lastName) { result in
            completion(result)
        }
    }
    
    
    init() {
        
    }
    
    func login(email: String, password: String, completion: @escaping (Result<UserModel, NetworkError>) -> Void) {
        HTTPClient.shared.login(email: email, password: password) { result in
            completion(result)
        }
    }
}
