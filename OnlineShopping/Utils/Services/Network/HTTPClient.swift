//
//  HTTPClient.swift
//  OnlineShopping
//
//  Created by HaiPH7.FA on 11/07/2023.
//

import Foundation

class HTTPClient {
    
    static let shared = HTTPClient()
    
    func register(email: String, password: String, firstName: String?, lastName: String?, completion: @escaping (Result<UserModel, NetworkError>) -> Void) {
        NetworkHelper.post(
            "http://localhost:3002/auth/register",
            parameters: [
                "email" : email,
                "password" : password,
                "firstName" : firstName,
                "lastName" : lastName
            ]
        ) { response in
            completion(.success(response))
        } errorHandler: { error in
            completion(.failure(error))
        }
    }
    
    func login(email: String, password: String, completion: @escaping (Result<UserModel, NetworkError>) -> Void) {
        NetworkHelper.post(
            "http://localhost:3002/auth/login",
            parameters: ["email" : email,
                         "password" : password
                        ]
        ) { response in
            completion(.success(response))
        } errorHandler: { error in
            completion(.failure(error))
        }
    }
}
