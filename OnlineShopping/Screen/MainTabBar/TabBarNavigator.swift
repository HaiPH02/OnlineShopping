//
//  TabBarNavigator.swift
//  OnlineShopping
//
//  Created by HaiPH7.FA on 21/07/2023.
//

import Foundation
import SwiftUI

class TabBarNavigator: ObservableObject {
    enum Pushable: Identifiable, Hashable {
        var id: Pushable { self }

        case cart
    }

    struct Presentable: Identifiable, Equatable {
        var id: String = UUID().uuidString
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
        let fullScreenPresentables: [Presentable] = []
        return .constant(fullScreenPresentables.contains(presenting))
    }

    func isModal() -> Binding<Bool> {
        guard let presenting = presenting else { return .constant(false) }
        let modalPresentables: [Presentable] = []
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
