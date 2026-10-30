//
//  AllMenuView.swift
//  SOPT39-Assignment
//
//  Created by BY on 10/30/26.
//

import SwiftUI

enum OrderMainMenu {
    case allMenu
    case myMenu
}

struct AllMenuView: View {
    @State private var viewModel = OrderViewModel()
    @State private var selectedMainMenu: OrderMainMenu = .allMenu

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 0) {
                HStack(alignment: .center, spacing: 0) {
                    Spacer()

                    Button {
                    } label: {
                        Image(.searchIcon)
                            .resizable()
                            .frame(width: 21, height: 21)
                    }
                }
                .frame(height: 49)
                .padding(.horizontal, 21)

                HStack(alignment: .center, spacing: 0) {
                    Text("Order")
                        .font(.orderTitle)
                        .foregroundColor(.black)

                    Spacer()
                }
                .frame(height: 46)
                .padding(.horizontal, 18)

                HStack(alignment: .center, spacing: 0) {
                    OrderMainMenuButton(
                        title: "전체 메뉴",
                        menu: .allMenu,
                        selectedMenu: $selectedMainMenu
                    )

                    OrderMainMenuButton(
                        title: "나만의 메뉴",
                        menu: .myMenu,
                        selectedMenu: $selectedMainMenu
                    )

                    Spacer()
                }

                HStack(alignment: .center, spacing: 28) {
                    OrderCategoryButton(
                        title: "음료",
                        menuType: .beverage,
                        selectedMenuType: $viewModel.selectedMenuType
                    )

                    OrderCategoryButton(
                        title: "푸드",
                        menuType: .food,
                        selectedMenuType: $viewModel.selectedMenuType
                    )

                    OrderCategoryButton(
                        title: "상품",
                        menuType: .product,
                        selectedMenuType: $viewModel.selectedMenuType
                    )
                }
                .padding(.horizontal, 42)
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(height: 54)
                .overlay(alignment: .top) {
                    Rectangle()
                        .fill(.starbucksGray200)
                        .frame(height: 1)
                }
                .overlay(alignment: .bottom) {
                    Rectangle()
                        .fill(.starbucksGray200)
                        .frame(height: 1)
                }

                ScrollView {
                    VStack(alignment: .leading, spacing: 21) {
                        ForEach(viewModel.allMenus) { menu in
                            NavigationLink {
                                if menu.name == "NEW" {
                                    NewMenuView()
                                } else {
                                    Text(menu.name)
                                }
                            } label: {
                                HStack(alignment: .center, spacing: 21) {
                                    Image(menu.imageName)
                                        .resizable()
                                        .frame(width: 61, height: 61)
                                        .clipShape(.circle)

                                    Text(menu.name)
                                        .font(.orderMenu)
                                        .foregroundColor(.black)
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal, 28)
                            }
                        }
                    }
                    .padding(.top, 26)
                    .padding(.bottom, 21)
                }

                OrderStoreBar()
            }
            .background(.white)
        }
    }
}

struct OrderMainMenuButton: View {
    let title: String
    let menu: OrderMainMenu
    @Binding var selectedMenu: OrderMainMenu

    var body: some View {
        Button {
            selectedMenu = menu
        } label: {
            VStack(alignment: .center, spacing: 0) {
                Text(title)
                    .font(.orderTab)
                    .foregroundColor(
                        selectedMenu == menu
                        ? .starbucksGreen
                        : .starbucksGray300
                    )
                    .frame(height: 42)

                Rectangle()
                    .fill(
                        selectedMenu == menu
                        ? .starbucksGreen
                        : .clear
                    )
                    .frame(height: 4)
            }
            .frame(width: 130, height: 46)
        }
    }
}

struct OrderCategoryButton: View {
    let title: String
    let menuType: OrderMenuType
    @Binding var selectedMenuType: OrderMenuType

    var body: some View {
        Button {
            selectedMenuType = menuType
        } label: {
            Text(title)
                .font(.orderTab)
                .foregroundColor(
                    selectedMenuType == menuType
                    ? .black
                    : .starbucksGray300
                )
        }
    }
}

#Preview {
    AllMenuView()
}
