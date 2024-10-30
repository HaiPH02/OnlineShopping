//
//  View+Extension.swift
//  OnlineShopping
//
//  Created by HaiPH7.FA on 06/07/2023.
//

import Foundation
import SwiftUI

extension View {
    var uiView: UIView {
        let view = UIHostingController(rootView: self).view
        return view ?? UIView()
    }
    
    @ViewBuilder
    func backgroundColor(color: Color) -> some View {
        ZStack(alignment: .top) {
            color
                .ignoresSafeArea()
            
            self
        }
    }
}
