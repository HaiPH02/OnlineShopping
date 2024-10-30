//
//  Collection+Extension.swift
//  OnlineShopping
//
//  Created by HaiPH7.FA on 21/07/2023.
//

import Foundation

extension Array where Element: Codable {
    func json() -> String? {
        guard let encoded = try? JSONEncoder().encode(self) else {
            return nil
        }
        return String(data: encoded, encoding: .utf8)
    }
}
