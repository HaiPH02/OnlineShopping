//
//  LoginViewModel.swift
//  OnlineShopping
//
//  Created by HaiPH7.FA on 17/07/2023.
//

import Foundation
import SwiftUI

class LoginViewModel: ObservableObject {
    private var productService = ProductService()
    
    @AppStorage("AUTH_KEY") var authenticated = false
    
    @Published var username = ""
    @Published var password = ""
    @Published var invalid: Bool = false
    
    private var sampleUser = "username"
    private var samplePassword = "password"
    
    @Published var didLoginSuccess = false
    @Published var error: NetworkError?
    
    init() {
        print("Currently logged on: \(authenticated)")
        print("Current user: \(username)")
    }
    
    func toggleAuthentication() {
        self.password = ""
        authenticated.toggle()
    }
    
    func authenticate() {
        
        toggleAuthentication()
        print("email: \(username), password: \(password)")
        productService.login(email: username, password: password) { user in
            print("\(user)")
            self.didLoginSuccess = true
        }
    }
    
    func login(email: String, password: String) {
        productService.login(email: email, password: password) { result in
            switch result {
            case .success( _):
                self.authenticated = true
            case .failure(let error):
                self.authenticated = true
            }
        }
    }
    
    func logOut() {
        toggleAuthentication()
    }
    
    func logPressed() {
        print("Button Pressed.")
    }
}
