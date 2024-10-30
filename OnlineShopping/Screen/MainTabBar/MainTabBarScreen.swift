//
//  MainTabBarScreen.swift
//  OnlineShopping
//
//  Created by HaiPH7.FA on 19/07/2023.
//

import SwiftUI



struct MainTabBarScreen: View {
    enum Tab: Identifiable {
        var id: Tab { self }
        
        case home
        case search
        case setting
    }
    
    @StateObject
    private var navigator = TabBarNavigator()
    
    @AppStorage(SettingKey.language.rawValue)
    private var language = String.languageCodeDevice
    
    @State
    var tab: Tab = .home

    var body: some View {
        NavigationView {
            TabView(selection: $tab) {
                HomeScreen()
                    .tabItem {
                        Text(String.product)
                        Image.home
                    }
                    .tag(Tab.home)
                
                SearchProductScreen()
                    .tabItem {
                        Text(String.search)
                        Image.magnifyingglass
                    }
                    .tag(Tab.search)

                SettingsScreen()
                    .tabItem {
                        Text(String.setting)
                        Image.gear
                    }
                    .tag(Tab.setting)
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .environmentObject(navigator)
            .background(
                links.opacity(.leastNonzeroMagnitude)
            )
        }
        .id(language)
    }
    
    @ViewBuilder
    private var links: some View {
        ZStack {
            NavigationLink(
                "",
                destination: destination(from: .cart),
                tag: .cart,
                selection: $navigator.pushing
            )
        }
    }
    
    @ViewBuilder
    private func destination(from pushable: TabBarNavigator.Pushable) -> some View {
        switch pushable {
        case .cart:
            CartScreen()
        }
    }
}
