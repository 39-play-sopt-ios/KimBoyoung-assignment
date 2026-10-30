//
//  MainTabView.swift
//  SOPT39-Assignment
//
//  Created by BY on 10/30/26.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = 2

    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Group {
                if selectedTab == 0 {
                    Text("Home")
                } else if selectedTab == 1 {
                    Text("Pay")
                } else if selectedTab == 2 {
                    AllMenuView()
                } else if selectedTab == 3 {
                    Text("Gift")
                } else {
                    Text("Other")
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

            MainBottomTabBar(selectedTab: $selectedTab)
        }
        .background(.white)
    }
}

struct MainBottomTabBar: View {
    @Binding var selectedTab: Int

    var body: some View {
        HStack(alignment: .top, spacing: 0) {
            MainTabButton(
                title: "Home",
                imageName: "navigation_icon-home",
                tab: 0,
                selectedTab: $selectedTab
            )

            Spacer()

            MainTabButton(
                title: "Pay",
                imageName: "navigation_icon-pay",
                tab: 1,
                selectedTab: $selectedTab
            )

            Spacer()

            MainTabButton(
                title: "Order",
                imageName: "navigation_icon-order",
                tab: 2,
                selectedTab: $selectedTab
            )

            Spacer()

            MainTabButton(
                title: "Gift",
                imageName: "navigation_icon-gift",
                tab: 3,
                selectedTab: $selectedTab
            )

            Spacer()

            MainTabButton(
                title: "Other",
                imageName: "navigation_icon-other",
                tab: 4,
                selectedTab: $selectedTab
            )
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 7)
        .frame(height: 62)
        .background(.white)
    }
}

struct MainTabButton: View {
    let title: String
    let imageName: String
    let tab: Int
    @Binding var selectedTab: Int

    var body: some View {
        Button {
            selectedTab = tab
        } label: {
            VStack(alignment: .center, spacing: 0) {
                Image(imageName)
                    .renderingMode(.template)
                    .resizable()
                    .foregroundColor(
                        selectedTab == tab
                        ? .starbucksGreen
                        : .starbucksGray400
                    )
                    .frame(width: 30, height: 30)

                Text(title)
                    .font(.cap1)
                    .foregroundColor(.starbucksGray400)
                    .frame(height: 18)
            }
            .frame(width: 44, height: 48)
        }
    }
}

#Preview {
    MainTabView()
}
