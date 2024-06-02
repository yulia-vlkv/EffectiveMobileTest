//
//  Coordinator.swift
//  EffectiveMobileTest
//
//  Created by Iuliia Volkova on 30.05.2024.
//

import SwiftUI

/// A coordinator class responsible for managing navigation within the app.
class Coordinator: ObservableObject {
    /// Enumeration defining different pages (or screens) in the app.
    enum Page {
        case avia, hotels, koroche, subscriptions, profile
    }
    
    /// An array representing the tabs available in the app.
    let tabs: [Page] = [.avia, .hotels, .koroche, .subscriptions, .profile]
    
    /// Navigation path representing the current navigation stack.
    @Published var path = NavigationPath()
    
    /// The root page of the app.
    @Published var root = Page.avia
    /// The direction of the push animation.
    @Published var pushDirection = Edge.trailing
    
    /// Pushes a new page onto the navigation stack.
    func push(_ page: Page) {
        withAnimation {
            path.append(page)
        }
    }
    
    /// Pops the top page from the navigation stack.
    func pop() {
        withAnimation {
            path.removeLast()
        }
    }
    
    /// Pops all pages from the navigation stack, leaving only the root page.
    func popToRoot() {
        withAnimation {
            path.removeLast(path.count)
        }
    }
    
    /// Changes the active tab to the specified page.
    func changeTab(to page: Page) {
        if root != page {
            if tabs.firstIndex(of: root) ?? Int.max < tabs.firstIndex(of: page) ?? Int.max {
                pushDirection = .trailing
            } else {
                pushDirection = .leading
            }
            withAnimation {
                path.removeLast(path.count)
                root = page
            }
        }
    }
    
    /// Retrieves the view associated with a given page.
    @ViewBuilder func view(for page: Page) -> some View {
        switch page {
        case .avia:
            AviaView()
        case .hotels:
            PlaceholderView(title: "Отели")
        case .koroche:
            PlaceholderView(title: "Короче")
        case .subscriptions:
            PlaceholderView(title: "Подписки")
        case .profile:
            PlaceholderView(title: "Профиль")
        }
    }
}

extension Coordinator.Page: Identifiable, Hashable {
    static func == (lhs: Coordinator.Page, rhs: Coordinator.Page) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    var id: String {
        switch self {
        case .avia:
            return "avia"
        case .hotels:
            return "hotels"
        case .koroche:
            return "koroche"
        case .subscriptions:
            return "subscriptions"
        case .profile:
            return "profile"
        }
    }
}
