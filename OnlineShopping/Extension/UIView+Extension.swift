//
//  UIView+Extension.swift
//  OnlineShopping
//
//  Created by HaiPH7.FA on 06/07/2023.
//

import Foundation
import UIKit

extension UIView {
    
    func removeAllSubviews() {
        self.subviews.forEach({ $0.removeAllSubviews() })
    }
}
