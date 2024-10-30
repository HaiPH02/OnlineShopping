//
//  String+Extension.swift
//  OnlineShopping
//
//  Created by HaiPH7.FA on 06/07/2023.
//

import Foundation
import SwiftUI

enum LanguageCode: String, CaseIterable, Identifiable {
    case english = "en"
    case vietnam = "vi"
    
    var id: String {
        return UUID().uuidString
    }
    
    var nativeName: String {
        switch self {
        case .english:
            return "English"
        case .vietnam:
            return "Tiếng Việt"
        }
    }
    
    var title: String {
        switch self {
        case .english:
            return "\(String.english) (\(nativeName))"
        case .vietnam:
            return "\(String.vietnamese) (\(nativeName))"
        }
    }
    
    func changeLanguage() {
        Settings.language.value = self.rawValue
        NotificationCenter.default.post(name: .languageDidChange, object: nil)
    }
}

extension String {
    
    static private let preferredLanguages = NSLocale.preferredLanguages
    
    var image: Image {
        return Image(self)
    }
    
    var systemImage: Image {
        return Image(systemName: self)
    }
    
    var uiSystemImage: UIImage? {
        return UIImage(systemName: self)
    }
    
    var color: Color {
        return Color(self)
    }
    
    static var languageCodeDevice: String {
        guard
            let currentLanguage = preferredLanguages.first,
            let languageCode = LanguageCode.allCases.filter({ currentLanguage.lowercased().contains($0.rawValue.lowercased()) }).first
        else { return LanguageCode.english.rawValue }
        return languageCode.rawValue
    }
    
    static var localeIdentifier: String {
        return Settings.language.value
    }
    
    func decode<T>() -> [T] where T: Codable {
        if let data = self.data(using: .utf8) {
            let objects = try? JSONDecoder().decode([T].self, from: data)
            return objects ?? []
        }
        return []
    }
}

extension String {
    init(
        resourceName: String,
        localizedKey key: String
    ) {
        var bundle: Bundle? = Bundle.main
        let resourceName = resourceName
        if let path = Bundle.main.path(
            forResource: resourceName,
            ofType: "lproj"
        ) {
            bundle = Bundle(path: path)
        }
        self = bundle?.localizedString(forKey: key, value: nil, table: nil) ?? key
    }
    
    init(localizedKey key: String) {
        self.init(resourceName: .localeIdentifier, localizedKey: key)
    }
    
    static var helloWorld: String { String(localizedKey: "helloWorld") }
    static var locked: String { String(localizedKey: "locked") }
    static var scanFaceID: String { String(localizedKey: "scanFaceID") }
    static var english: String { String(localizedKey: "english") }
    static var vietnamese: String { String(localizedKey: "vietnamese") }
    static var error: String { String(localizedKey: "error") }
    static var cancel: String { String(localizedKey: "cancel") }
    static var home: String { String(localizedKey: "home") }
    static var nowPlaying: String { String(localizedKey: "nowPlaying") }
    static var viewAll: String { String(localizedKey: "viewAll") }
    static var trending: String { String(localizedKey: "trending") }
    static var topRated: String { String(localizedKey: "topRated") }
    static var movie: String { String(localizedKey: "movie") }
    static var tv: String { String(localizedKey: "tv") }
    static var search: String { String(localizedKey: "search") }
    static var discover: String { String(localizedKey: "discover") }
    static var setting: String { String(localizedKey: "setting") }
    static var upcoming: String { String(localizedKey: "upcoming") }
    static var vote: String { String(localizedKey: "vote") }
    static var min: String { String(localizedKey: "min") }
    static var cast: String { String(localizedKey: "cast") }
    static var crews: String { String(localizedKey: "crews") }
    static var findOutMore: String { String(localizedKey: "findOutMore") }
    static var smimilar: String { String(localizedKey: "smimilar") }
    static var orderNow: String { String(localizedKey: "orderNow") }
    static var searchMovie: String { String(localizedKey: "searchMovie") }
    static var imagePlaceholderText: String { String(localizedKey: "imagePlaceholderText") }
    static var register: String { String(localizedKey: "register") }
    static var onlinShopping: String { String(localizedKey: "onlinShopping") }
    static var username: String { String(localizedKey: "username") }
    static var firstName: String { String(localizedKey: "firstName") }
    static var lastName: String { String(localizedKey: "lastName") }
    static var password: String { String(localizedKey: "password") }
    static var logout: String { String(localizedKey: "logout") }
    static var product: String { String(localizedKey: "product") }
    static var forgotPassword: String { String(localizedKey: "forgotPassword") }
    static var logIn: String { String(localizedKey: "logIn") }
    static var doHaveAccount: String { String(localizedKey: "doHaveAccount") }
    static var checkout: String { String(localizedKey: "checkout") }
    static var total: String { String(localizedKey: "total") }
    static var cart: String { String(localizedKey: "cart") }
    static var searchProduct: String { String(localizedKey: "searchProduct") }
}
