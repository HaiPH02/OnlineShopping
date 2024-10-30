//
//  RootView.swift
//  OnlineShopping
//
//  Created by HaiPH7.FA on 17/07/2023.
//

import Foundation
import SwiftUI

struct RootView: View {
    @AppStorage("AUTH_KEY") var authenticated = false

    var body: some View {
        Group {
            if authenticated {
                MainTabBarScreen()
            } else {
                LoginScreen()
            }
        }
        .animation(.easeInOut, value: authenticated)
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}

extension Notification.Name {
    static let themeDidChange = Notification.Name("THEME_DID_CHANGE")
    static let languageDidChange = Notification.Name("LANGUAGE_DID_CHANGE")
}
