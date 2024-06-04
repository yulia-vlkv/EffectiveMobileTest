//
//  TabBar.swift
//  EffectiveMobileTest
//
//  Created by Iuliia Volkova on 31.05.2024.
//

import SwiftUI

struct TabBar: View {
    @EnvironmentObject var coordinator: Coordinator
    
    var body: some View {
        HStack {
            TabBarButton(title: "Авиабилеты", iconName: "avia", tab: .avia)
            TabBarButton(title: "Отели", iconName: "hotel", tab: .hotels)
            TabBarButton(title: "Короче", iconName: "pin", tab: .shorterPath)
            TabBarButton(title: "Подписки", iconName: "subscription", tab: .subscriptions)
            TabBarButton(title: "Профиль", iconName: "profile", tab: .profile)
        }
        .background(Color.black)
        .frame(maxWidth: .infinity)
    }
}



//struct MenuBar: View {
//    @EnvironmentObject private var coordinator: Coordinator
//    
//    init() {}
//    
//    private var activeTab: Coordinator.Page? {
//        return coordinator.tabs.contains(coordinator.root) ? coordinator.root : nil
//    }
//    
//    var body: some View {
//        LazyVGrid(
//            columns: .init(
//                repeating: .init(
//                    .flexible(minimum: .zero, maximum: .greatestFiniteMagnitude),
//                    spacing: nil,
//                    alignment: .center
//                ),
//                count: coordinator.tabs.count
//            ),
//            alignment: .center,
//            spacing: 0
//        ) {
//            ForEach(coordinator.tabs, id: \.self) { tab in
//                MenuBarButton(
//                    tab: tab,
//                    isActiveTab: activeTab == tab
//                ) {
//                    coordinator.changeTab(to: tab)
//                }
//            }
//        }
//        .padding(.vertical)
//        .background(Color.black)
//    }
//}
//
#Preview {
    TabBar()
        .environmentObject(Coordinator())
}
