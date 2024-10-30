//
//  ContentView.swift
//  OnlineShopping
//
//  Created by HaiPH7.FA on 06/07/2023.
//

import SwiftUI

struct ContentView: View {
    private let isFirstInstall: Bool = UserDataDefaults.shared.isFirstInstall
    
    var body: some View {
        RootView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
