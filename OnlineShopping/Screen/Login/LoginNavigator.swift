//
//  LoginNavigator.swift
//  OnlineShopping
//
//  Created by HaiPH7.FA on 18/07/2023.
//

import Foundation
import SwiftUI

class LoginNavigator: ObservableObject {
    enum Pushable: String, CaseIterable, Identifiable {
        var id: Pushable { self }

        case register
        case forgetPassword
    }

    enum Presentable: String, CaseIterable, Identifiable {
        var id: Presentable { self }

        case legal
        case condition
    }

    @Published
    var pushing: Pushable?

    @Published
    var presenting: Presentable?

    var navigationStack: [Pushable] = []

    func present(_ presentable: Presentable) {
        self.presenting = presentable
    }

    func isFullScreenCover() -> Binding<Bool> {
        guard let presenting = presenting else { return .constant(false) }
        let fullScreenPresentables: [Presentable] = [.condition]
        return .constant(fullScreenPresentables.contains(presenting))
    }

    func isModal() -> Binding<Bool> {
        guard let presenting = presenting else { return .constant(false) }
        let modalPresentables: [Presentable] = [.legal]
        return .constant(modalPresentables.contains(presenting))
    }

    func dismiss() {
        self.presenting = nil
    }

    func push(to pushable: Pushable) {
        self.pushing = pushable
        navigationStack.append(pushable)
    }

    func popToRoot() {
        pushing = nil
    }

    func pop() {
        if navigationStack.isEmpty {
            pushing = nil
            return
        }
        _ = navigationStack.removeLast()
        pushing = navigationStack.last
    }
}
