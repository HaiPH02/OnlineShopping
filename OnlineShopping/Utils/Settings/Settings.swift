//
//  Settings.swift
//  OnlineShopping
//
//  Created by HaiPH7.FA on 14/07/2023.
//

import Foundation

enum SettingKey: String {
    case isAuthenticateNeeded
    case language
    case theme
    case cart
}

struct Settings {
    static var isAuthenticateNeeded = UserDefault<Bool>(key: SettingKey.isAuthenticateNeeded.rawValue,
                                                        defaultValue: false)
    static var language = UserDefault<String>(key: SettingKey.language.rawValue,
                                              defaultValue: String.languageCodeDevice)
    static var theme = UserDefault<Int>(key: SettingKey.theme.rawValue,
                                        defaultValue: Theme.freshOrange.rawValue)
    static var cart = UserDefault<String>(key: SettingKey.cart.rawValue,
                                          defaultValue: "")
}
