//
//  IconButton.swift
//  OnlineShopping
//
//  Created by HaiPH7.FA on 06/07/2023.
//

import Foundation
import SwiftUI

struct IconButton: View {
    init( icon: Image,
          size: CGSize = CGSize(width: 16, height: 16),
          action: @escaping () -> Void) {
        self.icon = icon
        self.size = size
        self.action = action
    }
    
    let icon: Image
    let size: CGSize
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            ZStack {
                Color.black.opacity(0.00001)
                icon
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
            }
        }
        .frame(width: size.width, height: size.height, alignment: .center)
    }
}
