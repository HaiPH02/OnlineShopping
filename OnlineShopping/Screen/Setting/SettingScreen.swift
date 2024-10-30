//
//  SettingScreen.swift
//  OnlineShopping
//
//  Created by HaiPH7.FA on 14/07/2023.
//

import Foundation
import SwiftUI

struct SettingsScreen: View {
    
    @AppStorage("AUTH_KEY") var authenticated = false
    @AppStorage(SettingKey.language.rawValue)
    private var language = String.languageCodeDevice
    
    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .leading, spacing: 1) {
                    ForEach(LanguageCode.allCases) { code in
                        Text(code.title)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.black)
                            .padding(.all, 20)
                            .onTapGesture {
                                if language != code.rawValue {
                                    code.changeLanguage()
                                }
                            }
                    }
                    
                    Text(String.logout)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(.red)
                        .padding(.all, 20)
                        .onTapGesture {
                            authenticated = false
                        }
                }
                .backgroundColor(color: .white)
                .cornerRadius(14)
                .padding(.all, 20)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .backgroundColor(color: .white)
            .navigationTitle(String.setting)
            .navigationBarTitleDisplayMode(.large)
            .id(language)
        }
    }
}
