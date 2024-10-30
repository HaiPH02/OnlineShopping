//
//  UserModel.swift
//  OnlineShopping
//
//  Created by HaiPH7.FA on 18/07/2023.
//

import Foundation

struct UserModel: Codable, Identifiable {
    let id: Int?
    let email: String?
    let firstName: String?
    let lastName: String?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case email
        case firstName
        case lastName
    }
}
