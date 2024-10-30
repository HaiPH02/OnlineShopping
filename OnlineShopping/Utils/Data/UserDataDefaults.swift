//
//  UserDataDefaults.swift
//  OnlineShopping
//
//  Created by HaiPH7.FA on 10/07/2023.
//

import Foundation

class UserDataDefaults {
    static let shared = UserDataDefaults()
    
    static private let keyIsFirstInstall: String = "keyIsFirstInstall"
    static private let keyCartProducts: String = "keyCartFoods"
    static var cartProducts: [Product] = []
    
    var isFirstInstall: Bool {
        get {
            return UserDefaults.standard.bool(forKey: UserDataDefaults.keyIsFirstInstall)
        }
        
        set {
            UserDefaults.standard.set(newValue, forKey: UserDataDefaults.keyIsFirstInstall)
            UserDefaults.standard.synchronize()
        }
    }
}

struct UserDefault<T> {
    let key: String
    let defaultValue: T
    
    private let userDefault: UserDefaults?
    
    public init(userDefault: UserDefaults? = .standard, key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
        self.userDefault = userDefault
    }
    
    public var value: T {
        get {
            if let value = userDefault?.object(forKey: key) as? T {
                return value
            } else {
                userDefault?.setValue(defaultValue, forKey: key)
                userDefault?.synchronize()
                return defaultValue
            }
        }
        set {
            userDefault?.setValue(newValue, forKey: key)
        }
    }
}
