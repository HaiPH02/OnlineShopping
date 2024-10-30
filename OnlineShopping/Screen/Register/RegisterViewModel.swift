//
//  RegisterViewModel.swift
//  OnlineShopping
//
//  Created by HaiPH7.FA on 17/07/2023.
//

import Foundation
import SwiftUI

class RegisterViewModel: ObservableObject {
    private var productService = ProductService()
    
    @Published var userName = ""
    @Published var password = ""
    @Published var firstName = ""
    @Published var lastName = ""
    
    @Published var didRegisterSuccess = false
    @Published var error: NetworkError?
    
    func logPressed() {
        print("Button Pressed.")
    }
    
    func register(email: String, password: String, firstName: String, lastName: String) {
        
        productService.register(email: email, password: password, firstName: firstName, lastName: lastName) { result in
            switch result {
            case .success(let data):
                self.didRegisterSuccess = true
            case .failure(let error):
                DispatchQueue.main.async {
                    self.error = error
                }
            }
        }
    }
}
